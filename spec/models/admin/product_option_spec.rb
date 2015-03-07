require 'rails_helper'

RSpec.describe Admin::ProductOption, type: :model do
    context "will vaild" do
	  	it "when all field filled" do
	  		product_option = build(:product_option)
	  		expect(product_option).to be_valid
	  	end
    end
  
    context "will not vaild" do
		it "when text is empty" do
			product_option = build(:product_option, text: nil)
			expect(product_option).not_to be_valid
			#expect(article.errors.messages[:article_category_id]).to include "不能为空"
		end

	end
end
