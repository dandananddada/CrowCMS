json.array!(@admin_articles) do |admin_article|
  json.extract! admin_article, :id, :title, :article_category_id, :author, :is_recommand, :is_carousel, :is_mark, :content, :abstract, :thumb_url, :file_url, :hits
  json.url admin_article_url(admin_article, format: :json)
end
