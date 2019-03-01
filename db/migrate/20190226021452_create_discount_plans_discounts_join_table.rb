class CreateDiscountPlansDiscountsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :discount_plans, :discounts do |t|
      t.index [:discount_plan_id, :discount_id], name: 'idx_discount_plans_discounts_1'
      t.index [:discount_id, :discount_plan_id], name: 'idx_discount_plans_discounts_2'
    end
  end
end
