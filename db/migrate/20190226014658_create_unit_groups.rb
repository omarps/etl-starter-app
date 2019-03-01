class CreateUnitGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :unit_groups do |t|
      t.string :guid
      t.float :price
      t.string :group_key
      t.string :name
      t.integer :available_units_count
      t.integer :total_units_count
      t.integer :total_non_excluded_units_count
      t.string :size
      t.integer :standard_rate
      t.integer :floor
      t.float :reduced_price
      t.integer :occupancy_percent
      t.integer :area
      t.integer :length
      t.integer :width
      t.integer :height
      t.float :due_at_move_in
      t.float :due_at_move_in_without_fees
      t.integer :due_monthly
      t.string :attribute_description
      t.string :description
      t.float :average_rent
      t.string :active_rate_type
      t.references :channel_rate, foreign_key: true
      t.references :unit_type, foreign_key: true

      t.timestamps
    end
  end
end
