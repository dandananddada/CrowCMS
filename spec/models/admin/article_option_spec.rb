require 'rails_helper'

RSpec.describe Admin::ArticleOption, type: :model do
    context "will vaild" do
	  	it "when all field filled" do
	  		article_option = build(:article_option)
	  		expect(article_option).to be_valid
	  	end
    end
  
    context "will not vaild" do
		it "when text is empty" do
			article_option = build(:article_option, text: nil)
			expect(article_option).not_to be_valid
		end

		it "when text is number" do
			article_option = build(:article_option, text: "1")
			expect(article_option).not_to be_valid
		end

		it "when text have existed" do
			article_option = create(:article_option, text: "have existed")
			existed_article_option = build(:existed_article_option, text: "have existed")
			expect(existed_article_option).not_to be_valid
		end

	end
end
