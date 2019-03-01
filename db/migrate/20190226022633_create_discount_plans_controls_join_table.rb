class CreateDiscountPlansControlsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :discount_plans, :controls do |t|
      t.index [:discount_plan_id, :control_id], name: 'idx_discount_plans_controls_1'
      t.index [:control_id, :discount_plan_id], name: 'idx_discount_plans_controls_2'
    end
  end
end
