json.array!(@admin_friend_links) do |admin_friend_link|
  json.extract! admin_friend_link, :id, :title, :url
  json.url admin_friend_link_url(admin_friend_link, format: :json)
end
