FactoryBot.define do
  # TODO: rename to array.
  factory :units_csv_2_hash, class:Array do
    defaults = [
      'guid' => 1,
      'name' => 'name',
      'unit_amenities' => 'one | two | three'
      # 'unit_group_id' => 1,
      # 'current_ledger_guid' => 1,
      # 'current_tenant_guid' => 1
    ]
    skip_create
    initialize_with{ defaults }
  end
end
