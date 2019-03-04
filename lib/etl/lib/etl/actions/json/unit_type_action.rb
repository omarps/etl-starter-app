module Etl
  module Actions
    module Json
      class UnitTypeAction
        extend ::LightService::Action
        expects :unit_groups_hash
        
        executed do |ctx|
          ctx.unit_groups_hash.each do |unit_group|
            next if unit_group['unit_type'].nil?
            unit_type = unit_group['unit_type']
            unit_type['guid'] = unit_type.delete('id')
            Etl::Actions::Utils::ar_create(ctx, ::UnitType, unit_type)
          end
        end
      end
    end
  end
end