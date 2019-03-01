class CreateUnitAmenitiesUnitsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :unit_amenities, :units do |t|
      t.index [:unit_amenity_id, :unit_id], name: 'idx_unit_amenities_units_1'
      t.index [:unit_id, :unit_amenity_id], name: 'idx_unit_amenities_units_2'
    end
  end
end
