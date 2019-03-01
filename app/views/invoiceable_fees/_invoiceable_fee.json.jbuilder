json.extract! invoiceable_fee, :id, :guid, :product_code, :kind, :description, :required_at_move_in, :required_at_transfer, :amount, :short_description, :show_in_sales_center, :tax_total, :total, :created_at, :updated_at
json.url invoiceable_fee_url(invoiceable_fee, format: :json)
