require 'rails_helper'

RSpec.describe Admin::Category, type: :model do
	before do
		@category = create(:category, title: "artile is forbidden", is_article: true)
	end

  context "will vaild" do
  	it "when all field filled" do
  		category = build(:category)
  		expect(category).to be_valid
  	end
  end

  context "will not vaild" do
  	it "when title empty" do
  		category = build(:category, title: nil)
  		expect(category).not_to be_valid
		expect(category.errors.messages[:title]).to include "不能为空"
  	end
  end

  context "select category" do
  	it "which article is permit" do
  		result = Admin::Category.select_article_categories.first
  		expect(result.is_article).to be true
  	end
  end

end
