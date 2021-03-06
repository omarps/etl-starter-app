module Etl
  module Actions
    module Json
      class InvoiceableFeesAction
        extend ::LightService::Action
        expects :unit_groups_hash
        
        executed do |ctx|
          ctx.unit_groups_hash.each do |unit_group|
            unit_group['invoiceable_fees'].each do |invoiceable_fee|
              invoiceable_fee['guid'] = invoiceable_fee.delete('id')
              Etl::Actions::Utils::ar_create(ctx, ::InvoiceableFee, invoiceable_fee)
            end
          end
        end
      end
    end
  end
end