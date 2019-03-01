module Etl
  module Actions
    module Json
      class DiscountPlansAction
        extend ::LightService::Action
        expects :unit_groups_hash
        
        executed do |ctx|
          ctx.unit_groups_hash.each do |unit_group|
            unit_group['discount_plans'].each do |discount_plan|
              discount_plan['guid'] = discount_plan.delete('id')
              discount_plan['tenant_account_kind_guid'] = discount_plan.delete('tenant_account_kind_id')
              discount_plan['api_association_guids'] = discount_plan.delete('api_association_ids')
              discount_plan['always_discount_plan_discount_guid'] = discount_plan.delete('always_discount_plan_discount_id')
              discount_plan['facility_guids'] = discount_plan.delete('facility_ids')
              discount_plan_discounts = discount_plan.delete('discount_plan_discounts')
              discount_plan_controls = discount_plan.delete('discount_plan_controls')
              client_applications = discount_plan.delete('client_applications')
              
              unless ::DiscountPlan.exists?(guid: discount_plan['guid'])
                ::DiscountPlan.create!(discount_plan)
              end
              
              process_discount_plan_discounts(discount_plan['guid'], discount_plan_discounts)
              process_discount_plan_controls(discount_plan['guid'], discount_plan_controls)
              process_client_applications(discount_plan['guid'], client_applications)
            end
          end
        end
        
        def self.process_discount_plan_discounts(guid, discount_plan_discounts)
          # TODO: validate discount exists?
          return unless ::DiscountPlan.exists?(guid: guid) || !discount_plan_discounts.empty?
          discount_plan = ::DiscountPlan.find_by(guid: guid)
          discount_plan_discounts.each do |discount|
            discount_plan.discounts << ::Discount.find_by(guid: discount['guid'])
          end
          discount_plan.save!
        end
        
        def self.process_discount_plan_controls(guid, discount_plan_controls)
          # TODO: validate discount exists?
          return unless ::DiscountPlan.exists?(guid: guid) || !discount_plan_controls.empty?
          discount_plan = ::DiscountPlan.find_by(guid: guid)
          discount_plan_controls.each do |control|
            discount_plan.controls << ::Control.find_by(guid: control['guid'])
          end
          discount_plan.save!
        end
        
        def self.process_client_applications(guid, client_applications)
          # TODO: validate discount exists?
          return unless ::DiscountPlan.exists?(guid: guid) || !client_applications.empty?
          discount_plan = ::DiscountPlan.find_by(guid: guid)
          client_applications.each do |client_application|
            discount_plan.client_applications << ::ClientApplication.find_by(guid: client_application['guid'])
          end
          discount_plan.save!
        end
      end
    end
  end
end
