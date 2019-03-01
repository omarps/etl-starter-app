class Discount < ApplicationRecord
  has_and_belongs_to_many :discount_plans,
                          join_table: :discount_plans_discounts,
                          association_foreign_key: :discount_plan_id,
                          foreign_key: :discount_id
end
