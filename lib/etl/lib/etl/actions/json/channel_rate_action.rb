module Etl
  module Actions
    module Json
      class ChannelRateAction
        extend ::LightService::Action
        expects :unit_groups_hash
        
        executed do |ctx|
          ctx.unit_groups_hash.each do |unit_group|
            next if unit_group['channel_rate'].nil?
            channel_rate = unit_group['channel_rate']
            channel_rate['guid'] = channel_rate.delete('id')
            channel_rate['channel_guid'] = channel_rate.delete('channel_id')
            channel_rate['facility_guid'] = channel_rate.delete('facility_id')
            Etl::Actions::Utils::ar_create(ctx, ::ChannelRate, channel_rate)
          end
        end
      end
    end
  end
end