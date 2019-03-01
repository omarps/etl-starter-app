class CreateUnitGroupsInvoiceableFeesJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :unit_groups, :invoiceable_fees do |t|
      t.index [:unit_group_id, :invoiceable_fee_id], name: 'idx_unit_groups_invoiceable_fees_1'
      t.index [:invoiceable_fee_id, :unit_group_id], name: 'idx_unit_groups_invoiceable_fees_2'
    end
  end
end
