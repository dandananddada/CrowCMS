json.array!(@admin_album_tags) do |admin_album_tag|
  json.extract! admin_album_tag, :id, :text
  json.url admin_album_tag_url(admin_album_tag, format: :json)
end
