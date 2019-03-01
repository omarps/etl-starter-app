class Control < ApplicationRecord
  has_and_belongs_to_many :discount_plans,
                          join_table: :controls_discount_plans,
                          association_foreign_key: :discount_plan_id,
                          foreign_key: :control_id

  has_and_belongs_to_many :unit_amenities,
                          join_table: :controls_unit_amenities,
                          association_foreign_key: :unit_amenities_id,
                          foreign_key: :control_id
end
