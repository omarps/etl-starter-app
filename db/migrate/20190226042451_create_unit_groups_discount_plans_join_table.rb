class CreateUnitGroupsDiscountPlansJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :unit_groups, :discount_plans do |t|
      t.index [:unit_group_id, :discount_plan_id], name: 'idx_unit_groups_discount_plans_1'
      t.index [:discount_plan_id, :unit_group_id], name: 'idx_unit_groups_discount_plans_2'
    end
  end
end
