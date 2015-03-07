json.array!(@admin_product_options) do |admin_product_option|
  json.extract! admin_product_option, :id, :text
  json.url admin_product_option_url(admin_product_option, format: :json)
end
