class CreateControlsUnitAmenitiesJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :controls, :unit_amenities do |t|
      t.index [:control_id, :unit_amenity_id], name: 'idx_controls_unit_amenities_1'
      t.index [:unit_amenity_id, :control_id], name: 'idx_controls_unit_amenities_2'
    end
  end
end
