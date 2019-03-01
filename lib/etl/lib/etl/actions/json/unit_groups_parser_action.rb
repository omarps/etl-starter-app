module Etl
  module Actions
    module Json
      class UnitGroupsParserAction
        extend ::LightService::Action
        expects :unit_groups_text
        promises :unit_groups_hash
        
        executed do |ctx|
          unit_groups_text = ctx.unit_groups_text
          unit_groups_hash = JSON.parse(unit_groups_text)
          ctx.unit_groups_hash = unit_groups_hash['unit_groups']
        end
      end
    end
  end
end
