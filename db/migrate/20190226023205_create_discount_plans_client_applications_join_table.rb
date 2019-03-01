class CreateDiscountPlansClientApplicationsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :discount_plans, :client_applications do |t|
      t.index [:discount_plan_id, :client_application_id], name: 'idx_discount_plans_client_applications_1'
      t.index [:client_application_id, :discount_plan_id], name: 'idx_discount_plans_client_applications_2'
    end
  end
end
