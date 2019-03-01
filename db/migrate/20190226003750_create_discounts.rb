class CreateDiscounts < ActiveRecord::Migration[5.2]
  def change
    create_table :discounts do |t|
      t.string :guid
      t.string :discount_type
      t.integer :month_number
      t.float :amount
      t.float :minimum_amount
      t.float :maximum_amount

      t.timestamps
    end
  end
end
