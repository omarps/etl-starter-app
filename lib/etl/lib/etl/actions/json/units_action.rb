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
            unit.delete('channel_rate')
            unit_amenities = unit.delete('unit_amenities')
            
            unless ::Unit.exists?(guid: unit['guid'])
              ar_unit = ::Unit.new(unit)
              ar_unit.unit_group = ::UnitGroup.find_by(guid: unit.delete('unit_group_id'))
              ar_unit.save!
            end
            
            process_unit_amenities(unit['guid'], unit_amenities)
          end
        end
        
        def self.process_unit_amenities(guid, unit_amenities)
          # TODO: validate discount exists?
          return unless ::Unit.exists?(guid: guid) || !unit_amenities.empty?
          unit = ::Unit.find_by(guid: guid)
          unit_amenities.each do |unit_amenity|
            unit.unit_amenities << ::UnitAmenity.find_by(guid: unit_amenity['guid'])
          end
          unit.save!
        end
      end
    end
  end
end
