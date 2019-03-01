class InvoiceableFee < ApplicationRecord
  has_and_belongs_to_many :unit_groups,
                          join_table: :invoiceable_fees_unit_groups,
                          association_foreign_key: :unit_group_id,
                          foreign_key: :invoiceable_fee_id
end
