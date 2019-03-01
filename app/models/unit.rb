class Unit < ApplicationRecord
  belongs_to :unit_group

  has_and_belongs_to_many :unit_amenities,
                          join_table: :unit_amenities_units,
                          association_foreign_key: :unit_amenity_id,
                          foreign_key: :unit_id
end
