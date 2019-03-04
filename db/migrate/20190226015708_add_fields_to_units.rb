class AddFieldsToUnits < ActiveRecord::Migration[5.2]
  def change
    add_column :units, :guid, :string
    add_column :units, :width, :integer
    add_column :units, :length, :integer
    add_column :units, :height, :integer
    add_column :units, :door_height, :integer
    add_column :units, :door_width, :integer
    add_column :units, :door_type, :string
    add_column :units, :access_type, :string
    add_column :units, :floor, :integer
    add_column :units, :size, :string
    add_column :units, :standard_rate, :float
    add_column :units, :managed_rate, :float
    add_column :units, :available_for_move_in, :boolean
    add_column :units, :rentable, :boolean
    add_column :units, :status, :string
    add_column :units, :payment_status, :string
    add_column :units, :current_ledger_guid, :string
    add_column :units, :current_tenant_guid, :string
    add_column :units, :combination_lock_number, :string
    add_column :units, :attribute_description, :string
    add_column :units, :deleted, :boolean
    add_column :units, :damaged, :boolean
    add_column :units, :complimentary, :boolean
    add_reference :units, :unit_group, foreign_key: true
  end
end
