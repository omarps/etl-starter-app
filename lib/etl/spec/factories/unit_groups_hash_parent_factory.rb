FactoryBot.define do
  # TODO: rename to array.
  factory :unit_groups_hash_parent, class:Array do
    defaults = [
      {
        'id' => 1,
        'name' => 'unit group',
        'invoiceable_fees' => [
          {
            'id' => 1,
            'name' => 'invoiceable fee'
          }
        ],
        'channel_rate' => {
          'id' => 1,
          'name' => 'channel rate'
        },
        'unit_type' => {
          'id' => 1,
          'name' => 'unit type'
        },
        'discount_plans' => [
          {
            'id' => 1,
            'name' => 'discount plan',
            'tenant_account_kind_id' => 2,
            'api_association_ids' => 3,
            'always_discount_plan_discount_id' => 4,
            'facility_ids' => 5,
            'discount_plan_discounts' => [
              'id' => 1,
              'name' => 'discount'
            ],
            'discount_plan_controls' => [
              'id' => 1,
              'name' => 'control'
            ],
            'client_applications' => [
              'id' => 1,
              'name' => 'client application'
            ]
          }
        ],
        'scheduled_move_out_ids' => 1,
        'channel_rate_ids' => [2],
        'channel_rate' => 1,
        'unit_type' => 1,
      }
    ]
    skip_create
    initialize_with{ defaults }
  end
end
