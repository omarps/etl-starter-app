class AddScheduledMoveOutGuidsToUnitGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :unit_groups, :scheduled_move_out_guids, :text, default: [].to_yaml, array:true
  end
end
