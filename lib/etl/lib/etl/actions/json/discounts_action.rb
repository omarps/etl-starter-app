module Etl
  module Actions
    module Json
      class DiscountsAction
        extend ::LightService::Action
        expects :unit_groups_hash
        
        executed do |ctx|
          ctx.unit_groups_hash.each do |unit_group|
            unit_group['discount_plans'].each do |discount_plan|
              discount_plan['discount_plan_discounts'].each do |discount|
                discount['guid'] = discount.delete('id')
                unless ::Discount.exists?(guid: discount['guid'])
                  ::Discount.create!(discount)
                end
              end
            end
          end
        end
      end
    end
  end
end