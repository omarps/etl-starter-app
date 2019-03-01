module Etl
  module Actions
    module Json
      class UnitAmenitiesAction
        extend ::LightService::Action
        expects :units_json_hash
        
        executed do |ctx|
          ctx.units_json_hash.each do |unit|
            unit['unit_amenities'].each do |unit_amenity|
              unit_amenity['guid'] = unit_amenity.delete('id')
              unless ::UnitAmenity.exists?(guid: unit_amenity['guid'])
                ::UnitAmenity.create!(unit_amenity)
              end
            end
          end
        end
      end
    end
  end
end
