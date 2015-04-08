json.array!(@admin_links) do |admin_link|
  json.extract! admin_link, :id, :title, :url
  json.url admin_link_url(admin_link, format: :json)
end
