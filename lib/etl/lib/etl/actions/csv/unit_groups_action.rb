module Etl
  module Actions
    module Csv
      class UnitGroupsAction
        extend ::LightService::Action
        expects :units_csv_hash
        
        executed do |ctx|
          ctx.units_csv_hash.each do |unit|
            unless ::UnitGroup.exists?(guid: unit['unit_group_id'])
              ::UnitGroup.create!(guid: unit['unit_group_id'])
            end
            
            process_unit_type(unit['unit_group_id'], unit['unit_type'])
          end
        end
        
        def self.process_unit_type(guid, unit_type)
          return unless ::UnitGroup.exists?(guid: guid) && !unit_type.nil?
          unit_group = ::UnitGroup.find_by(guid: guid)
          unit_group.unit_type = ::UnitType.find_by(name: unit_type)
          unit_group.save!
        end
      end
    end
  end
end
