class UnitAmenity < ApplicationRecord
  has_and_belongs_to_many :controls,
                          join_table: :controls_unit_amenities,
                          association_foreign_key: :control_id,
                          foreign_key: :unit_amenities_id

  has_and_belongs_to_many :units,
                          join_table: :unit_amenities_units,
                          association_foreign_key: :unit_id,
                          foreign_key: :unit_amenity_id
end
