json.array!(@admin_article_pictures) do |admin_article_picture|
  json.extract! admin_article_picture, :id, :article_id
  json.url admin_article_picture_url(admin_article_picture, format: :json)
end
