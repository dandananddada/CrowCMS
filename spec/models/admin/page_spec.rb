require 'rails_helper'

RSpec.describe Admin::Page, type: :model do

    context "will vaild" do
	  	it "when all field filled" do
	  		page = build(:page)
	  		expect(page).to be_valid
	  	end
    end
  
    context "will not vaild" do
		it "when title is empty" do
			page = build(:page, title: nil)
			expect(page).not_to be_valid
			#expect(article.errors.messages[:article_category_id]).to include "不能为空"
		end

		it "when content is empty" do
			page = build(:page, content: nil)
			expect(page).not_to be_valid
			#expect(article.errors.messages[:title]).to include "不能为空"
		end

	end
end
