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
            unit_group['channel_rate_id'] = Etl::Actions::Utils::ar_belongs_to_id(
              ::ChannelRate,
              unit_group.delete('channel_rate')
            )
            unit_group['unit_type_id'] = Etl::Actions::Utils::ar_belongs_to_id(
              ::UnitType,
              unit_group.delete('unit_type')
            )
            unit_amenities = unit_group.delete('unit_amenities')
            discount_plans = unit_group.delete('discount_plans')

            Etl::Actions::Utils::ar_create(ctx, ::UnitGroup, unit_group)

            Etl::Actions::Utils::ar_has_many_save!(
              ::UnitGroup, unit_group['guid'],
              ::InvoiceableFee, :invoiceable_fees, invoiceable_fees
            )
            Etl::Actions::Utils::ar_has_many_save!(
              ::UnitGroup, unit_group['guid'],
              ::DiscountPlan, :discount_plans, discount_plans
            )
          end
        end
      end
    end
  end
end