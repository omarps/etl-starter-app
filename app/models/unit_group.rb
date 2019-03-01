class UnitGroup < ApplicationRecord
  belongs_to :channel_rate, optional: true
  belongs_to :unit_type, optional: true
  has_many :units
  
  has_and_belongs_to_many :invoiceable_fees,
                          join_table: :invoiceable_fees_unit_groups,
                          association_foreign_key: :invoiceable_fee_id,
                          foreign_key: :unit_group_id

  has_and_belongs_to_many :discount_plans,
                          join_table: :discount_plans_unit_groups,
                          association_foreign_key: :discount_plan_id,
                          foreign_key: :unit_group_id
end
