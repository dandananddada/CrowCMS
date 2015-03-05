require 'rails_helper'

RSpec.describe Admin::ArticleCategory, type: :model do
	before do
		@article_category = create(:article_category, title: "artile is forbidden", is_article: true)
	end

  context "will vaild" do
  	it "when all field filled" do
  		article_category = build(:article_category)
  		expect(article_category).to be_valid
  	end
  end

  context "will not vaild" do
  	it "when title empty" do
  		article_category = build(:article_category, title: nil)
  		expect(article_category).not_to be_valid
		expect(article_category.errors.messages[:title]).to include "不能为空"
  	end
  end

  context "select category" do
	it "which article is permit" do
		result = Admin::ArticleCategory.select_article_categories.first
		expect(result.is_article).to be true
	end
  end

end
