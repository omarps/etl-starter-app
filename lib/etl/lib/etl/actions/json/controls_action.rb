module Etl
  module Actions
    module Json
      class ControlsAction
        extend ::LightService::Action
        expects :unit_groups_hash
        
        executed do |ctx|
          ctx.unit_groups_hash.each do |unit_group|
            unit_group['discount_plans'].each do |discount_plan|
              discount_plan['discount_plan_controls'].each do |control|
                control['guid'] = control.delete('id')
                control.except!('unit_amenity_ids', 'discount_plan_ids', 'unit_type_id')
                Etl::Actions::Utils::ar_create(ctx, ::Control, control)
              end
            end
          end
        end
      end
    end
  end
end