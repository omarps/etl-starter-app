module Etl
  module Actions
    module Json
      class UnitsAction
        extend ::LightService::Action
        expects :units_json_hash
        
        executed do |ctx|
          ctx.units_json_hash.each do |unit|
            next unless ::UnitGroup.exists?(guid: unit['unit_group_id'])
            unit['guid'] = unit.delete('id')
            unit['current_ledger_guid'] = unit.delete('current_ledger_id')
            unit['current_tenant_guid'] = unit.delete('current_tenant_id')
            unit['unit_group_id'] = Etl::Actions::Utils::ar_belongs_to_id(::UnitGroup, unit, 'unit_group_id')
            unit.delete('channel_rate')
            unit_amenities = unit.delete('unit_amenities')

            Etl::Actions::Utils::ar_create(ctx, ::Unit, unit)

            Etl::Actions::Utils::ar_has_many_save!(
              ::Unit, unit['guid'],
              ::UnitAmenity, :unit_amenities, unit_amenities
            )
          end
        end
      end
    end
  end
end
