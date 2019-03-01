json.extract! client_application, :id, :guid, :name, :channel_rates_on, :internal, :created_at, :updated_at
json.url client_application_url(client_application, format: :json)
