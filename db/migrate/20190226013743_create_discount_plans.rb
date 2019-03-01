class CreateDiscountPlans < ActiveRecord::Migration[5.2]
  def change
    create_table :discount_plans do |t|
      t.string :guid
      t.string :name
      t.string :description
      t.string :public_description
      t.string :availability_text
      t.string :requirements_text
      t.string :kind
      t.boolean :min_occupancy_required
      t.integer :min_occupancy_months
      t.boolean :prepay_required
      t.integer :prepay_months
      t.date :start_date
      t.date :end_date
      t.boolean :auto_apply
      t.string :promotion_type
      t.boolean :deleted
      t.boolean :turned_on
      t.boolean :available_for_all_facilities
      t.boolean :round_to_nearest
      t.boolean :hide_from_website
      t.boolean :move_in_only
      t.string :tenant_account_kind_guid
      t.boolean :existing_tenant_only
      t.integer :priority
      t.string :role_permission
      t.string :always_discount_plan_discount_guid

      t.timestamps
    end
  end
end
