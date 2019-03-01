module Etl
  module Actions
    module Csv
      class UnitGroupsAction
        extend ::LightService::Action
        expects :units_csv_hash
        
        executed do |ctx|
          ctx.units_csv_hash.each do |unit|
            # next unless ::UnitGroup.exists?(guid: unit['unit_group_id'])
            # unit['guid'] = unit.delete('id')
            # unit['current_ledger_guid'] = unit.delete('current_ledger_id')
            # unit['current_tenant_guid'] = unit.delete('current_tenant_id')
            # unit.delete('channel_rate')
            # unit_amenities = unit.delete('unit_amenities')
            
            unless ::UnitGroup.exists?(guid: unit['unit_group_id'])
              # ar_unit = ::Unit.new(unit)
              # ar_unit.unit_group = ::UnitGroup.find_by(guid: unit.delete('unit_group_id'))
              # ar_unit.save!
              ::UnitGroup.create!(guid: unit['unit_group_id'])
            end
            
            # process_unit_amenities(unit['guid'], unit_amenities)
          end
        end
      end
    end
  end
end
