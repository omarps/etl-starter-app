json.extract! channel_rate, :id, :base_rate_type, :modifier_type, :turned_on, :turned_off_on, :rate, :amount, :channel_name, :channel_guid, :facility_guid, :created_at, :updated_at
json.url channel_rate_url(channel_rate, format: :json)
