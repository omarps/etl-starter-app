module Etl
  module Actions
    module Json
      class UnitsParserFlattenerAction
        extend ::LightService::Action
        expects :units_json_dirpath
        promises :units_json_hash
        
        executed do |ctx|
          units_json_text_array = []
          Dir[ctx.units_json_dirpath].each do |unit_group_unit_json|
            units_json_text_array << File.read(unit_group_unit_json)
          end
          units_hash_array = []
          units_json_text_array.each do |unit_texts|
            units_hash_array << JSON.parse(unit_texts)['units']
          end
          ctx.units_json_hash = units_hash_array.flatten
        end
      end
    end
  end
end
