class ApiAssociationGuidsToDiscountPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :discount_plans, :api_association_guids, :text, default: [].to_yaml, array:true
  end
end
