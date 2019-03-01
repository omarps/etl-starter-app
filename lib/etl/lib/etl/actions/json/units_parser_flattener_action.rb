module Etl
  module Actions
    module Json
      class UnitsParserFlattenerAction
        extend ::LightService::Action
        expects :units_json_text_array
        promises :units_json_hash
        
        executed do |ctx|
          units_hash_array = []
          ctx.units_json_text_array.each do |unit_texts|
            units_hash_array << JSON.parse(unit_texts)['units']
          end
          ctx.units_json_hash = units_hash_array.flatten
        end
      end
    end
  end
end
