require 'rails_helper'

RSpec.describe Admin::ArticleCategory, type: :model do
	before do
		@article_category = create(:article_category, title: "artile is forbidden", is_article: true)
	end
  context "article category query validate" do
	it "get category which article is permit" do
		result = Admin::ArticleCategory.select_article_categories.first
		expect(result.is_article).to be true
	end
  end
end
