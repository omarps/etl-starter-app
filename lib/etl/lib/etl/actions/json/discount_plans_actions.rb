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

              Etl::Actions::Utils::ar_create(ctx, ::DiscountPlan, discount_plan)
              
              Etl::Actions::Utils::ar_has_many_save!(
                ::DiscountPlan, discount_plan['guid'],
                ::Discount, :discounts, discount_plan_discounts
              )
              Etl::Actions::Utils::ar_has_many_save!(
                ::DiscountPlan, discount_plan['guid'],
                ::Control, :controls, discount_plan_controls
              )
              Etl::Actions::Utils::ar_has_many_save!(
                ::DiscountPlan, discount_plan['guid'],
                ::ClientApplication, :client_applications, client_applications
              )
            end
          end
        end
      end
    end
  end
end
