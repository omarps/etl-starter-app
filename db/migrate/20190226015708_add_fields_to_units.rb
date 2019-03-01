class AddFieldsToUnits < ActiveRecord::Migration[5.2]
  def change
    add_column :units, :guid, :string
    add_column :units, :width, :integer
    add_column :units, :length, :integer
    add_column :units, :height, :intege
    add_column :units, :door_height, :intege
    add_column :units, :door_width, :intege
    add_column :units, :door_type, :string
    add_column :units, :access_type, :strin
    add_column :units, :floor, :intege
    add_column :units, :size, :strin
    add_column :units, :standard_rate, :floa
    add_column :units, :managed_rate, :floa
    add_column :units, :available_for_move_in, :boolea
    add_column :units, :rentable, :boolea
    add_column :units, :status, :string
    add_column :units, :payment_status, :strin
    add_column :units, :current_ledger_guid, :strin
    add_column :units, :current_tenant_guid, :strin
    add_column :units, :combination_lock_number, :strin
    add_column :units, :attribute_description, :strin
    add_column :units, :deleted, :boolea
    add_column :units, :damaged, :boolea
    add_column :units, :complimentary, :boolean
    add_reference :units, :unit_group, foreign_key: true
  end
end
