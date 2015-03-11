json.array!(@admin_article_options) do |admin_article_option|
  json.extract! admin_article_option, :id, :text
  json.url admin_article_option_url(admin_article_option, format: :json)
end
