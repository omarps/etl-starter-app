class DiscountPlan < ApplicationRecord
  has_and_belongs_to_many :discounts,
                          join_table: :discount_plans_discounts,
                          association_foreign_key: :discount_id,
                          foreign_key: :discount_plan_id
  
  has_and_belongs_to_many :controls,
                          join_table: :controls_discount_plans,
                          association_foreign_key: :control_id,
                          foreign_key: :discount_plan_id

  has_and_belongs_to_many :client_applications,
                          join_table: :client_applications_discount_plans,
                          association_foreign_key: :client_application_id,
                          foreign_key: :discount_plan_id

  has_and_belongs_to_many :client_applications,
                          join_table: :client_applications_discount_plans,
                          association_foreign_key: :client_application_id,
                          foreign_key: :discount_plan_id

  has_and_belongs_to_many :unit_groups,
                          join_table: :discount_plans_unit_groups,
                          association_foreign_key: :unit_groups_id,
                          foreign_key: :discount_plan_id
end
