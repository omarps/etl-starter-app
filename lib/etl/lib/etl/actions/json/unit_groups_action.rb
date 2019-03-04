module Etl
  module Actions
    module Json
      class UnitGroupsAction
        extend ::LightService::Action
        expects :unit_groups_hash
        
        executed do |ctx|
          ctx.unit_groups_hash.each do |unit_group|
            unit_group['guid'] = unit_group.delete('id')
            unit_group['scheduled_move_out_guids'] = unit_group.delete('scheduled_move_out_ids')
            unit_group['channel_rate_guids'] = unit_group.delete('channel_rate_ids')
            invoiceable_fees = unit_group.delete('invoiceable_fees')
            channel_rate = unit_group.delete('channel_rate')
            unit_amenities = unit_group.delete('unit_amenities')
            unit_type = unit_group.delete('unit_type')
            discount_plans = unit_group.delete('discount_plans')

            Etl::Actions::Utils::ar_create(ctx, ::UnitGroup, unit_group)
            
            process_invoiceable_fees(unit_group['guid'], invoiceable_fees)
            process_channel_rate(unit_group['guid'], channel_rate)
            process_unit_type(unit_group['guid'], unit_type)
            process_discount_plans(unit_group['guid'], discount_plans)
          end
        end
        
        def self.process_invoiceable_fees(guid, invoiceable_fees)
          # TODO: validate discount exists?
          return unless ::UnitGroup.exists?(guid: guid) || !invoiceable_fees.empty?
          unit_group = ::UnitGroup.find_by(guid: guid)
          invoiceable_fees.each do |invoiceable_fee|
            unit_group.invoiceable_fees << ::InvoiceableFee.find_by(guid: invoiceable_fee['guid'])
          end
          unit_group.save!
        end
        
        def self.process_channel_rate(guid, channel_rate)
          return unless ::UnitGroup.exists?(guid: guid) && !channel_rate.nil?
          unit_group = ::UnitGroup.find_by(guid: guid)
          unit_group.channel_rate = ::ChannelRate.find_by(guid: channel_rate['guid'])
          unit_group.save!
        end
        
        def self.process_unit_type(guid, unit_type)
          return unless ::UnitGroup.exists?(guid: guid) && !unit_type.nil?
          unit_group = ::UnitGroup.find_by(guid: guid)
          unit_group.unit_type = ::UnitType.find_by(guid: unit_type['guid'])
          unit_group.save!
        end
        
        def self.process_discount_plans(guid, discount_plans)
          # TODO: validate discount exists?
          return unless ::UnitGroup.exists?(guid: guid) || !discount_plans.empty?
          unit_group = ::UnitGroup.find_by(guid: guid)
          discount_plans.each do |discount_plan|
            unit_group.discount_plans << ::DiscountPlan.find_by(guid: discount_plan['guid'])
          end
          unit_group.save!
        end
      end
    end
  end
end