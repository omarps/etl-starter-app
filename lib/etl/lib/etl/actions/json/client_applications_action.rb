module Etl
  module Actions
    module Json
      class ClientApplicationsAction
        extend ::LightService::Action
        expects :unit_groups_hash
        
        executed do |ctx|
          ctx.unit_groups_hash.each do |unit_group|
            unit_group['discount_plans'].each do |discount_plan|
              discount_plan['client_applications'].each do |client_application|
                client_application['guid'] = client_application.delete('id')
                unless ::ClientApplication.exists?(guid: client_application['guid'])
                  ::ClientApplication.create!(client_application)
                end
              end
            end
          end
        end
      end
    end
  end
end