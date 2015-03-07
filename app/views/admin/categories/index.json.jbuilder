json.array!(@admin_article_categories) do |admin_article_category|
  json.extract! admin_article_category, :id, :ancestry, :title, :is_article, :is_thumb, :is_file, :is_abstract, is_carousel
  json.url admin_article_category_url(admin_article_category, format: :json)
end
