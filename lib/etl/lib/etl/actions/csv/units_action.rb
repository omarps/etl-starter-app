module Etl
  module Actions
    module Csv
      class UnitsAction
        extend ::LightService::Action
        expects :units_csv_hash
        
        executed do |ctx|
          ctx.units_csv_hash.each do |unit|
            next unless ::UnitGroup.exists?(guid: unit['unit_group_id'])
            unit['guid'] = unit.delete('id')
            unit['current_ledger_guid'] = unit.delete('current_ledger_id')
            unit['current_tenant_guid'] = unit.delete('current_tenant_id')
            unit.delete('channel_rate')
            unit_amenities = unit.delete('unit_amenities')
            unit_type = unit.delete('unit_type')
            
            unless ::Unit.exists?(guid: unit['guid'])
              ar_unit = ::Unit.new(unit)
              ar_unit.unit_group = ::UnitGroup.find_by(guid: unit.delete('unit_group_id'))
              ar_unit.save!
            end
            
            process_unit_amenities(unit['guid'], unit_amenities)
          end
        end
        
        def self.process_unit_amenities(guid, unit_amenities)
          return unless ::Unit.exists?(guid: guid) && !unit_amenities.nil?
          unit = ::Unit.find_by(guid: guid)
          unit_amenities.split('|').each do |unit_amenity|
            unit.unit_amenities << ::UnitAmenity.find_by(name: unit_amenity.strip)
          end
          unit.save!
        end
      end
    end
  end
end
