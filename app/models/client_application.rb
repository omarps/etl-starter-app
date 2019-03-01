class ClientApplication < ApplicationRecord
  has_and_belongs_to_many :discount_plans,
                          join_table: :client_applications_discount_plans,
                          association_foreign_key: :discount_plan_id,
                          foreign_key: :client_application_id
end
