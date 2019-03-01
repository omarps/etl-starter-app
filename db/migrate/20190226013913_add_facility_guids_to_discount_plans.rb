class AddFacilityGuidsToDiscountPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :discount_plans, :facility_guids, :text, default: [].to_yaml, array:true
  end
end
