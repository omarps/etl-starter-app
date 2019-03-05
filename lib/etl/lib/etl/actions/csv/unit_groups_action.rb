module Etl
  module Actions
    module Csv
      class UnitGroupsAction
        extend ::LightService::Action
        expects :units_csv_hash
        
        executed do |ctx|
          ctx.units_csv_hash.each do |unit|
            unit_group = {
              guid: unit['unit_group_id'],
              unit_type_id: ::UnitType.find_by(name: unit['unit_type']).id
            }
            Etl::Actions::Utils::ar_create(ctx, ::UnitGroup, unit_group, :guid, 'unit_group_id')
          end
        end
      end
    end
  end
end
