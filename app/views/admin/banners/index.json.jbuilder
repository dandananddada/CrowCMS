json.array!(@admin_banners) do |admin_banner|
  json.extract! admin_banner, :id, :name, :description, :url, :banner
  json.url admin_banner_url(admin_banner, format: :json)
end
