module Etl
  module Actions
    module Json
      class UnitGroupsParserAction
        extend ::LightService::Action
        expects :unit_groups_filename
        promises :unit_groups_hash
        
        executed do |ctx|
          unit_groups_text = File.read(ctx.unit_groups_filename)
          unit_groups_hash = JSON.parse(unit_groups_text)
          ctx.unit_groups_hash = unit_groups_hash['unit_groups']
        end
      end
    end
  end
end
