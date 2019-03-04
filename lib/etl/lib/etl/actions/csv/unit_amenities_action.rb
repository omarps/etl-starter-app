module Etl
  module Actions
    module Csv
      class UnitAmenitiesAction
        extend ::LightService::Action
        expects :units_csv_hash
        
        executed do |ctx|
          ctx.units_csv_hash.each do |unit|
            unit_amenities = unit.delete('unit_amenities')
            unit_amenities = unit_amenities.split('|').map(&:strip)
            unit_amenities.each do |unit_amenity|
              next if unit_amenity.nil? || unit_amenity.empty? || ['nil', 'null'].include?(unit_amenity)
              unless ::UnitAmenity.exists?(name: unit_amenity)
                ::UnitAmenity.create!(name: unit_amenity)
              end
            end
          end
        end
      end
    end
  end
end
