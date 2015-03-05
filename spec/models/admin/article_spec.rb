require 'rails_helper'

RSpec.describe Admin::Article, type: :model do

	context "will vaild" do
		it "when all field filled" do
			article = build(:article)
			expect(article).to be_valid
		end
	end

	context "will not vaild" do
		it "when artile category id is empty" do
			article = build(:article, article_category_id: nil)
			expect(article).not_to be_valid
			expect(article.errors.messages[:article_category_id]).to include "不能为空"
		end

		it "when title is empty" do
			article = build(:article, title: nil)
			expect(article).not_to be_valid
			expect(article.errors.messages[:title]).to include "不能为空"
		end

		it "when content is empty" do
			article = build(:article, content: nil)
			expect(article).not_to be_valid
			expect(article.errors.messages[:content]).to include "不能为空"
		end
	end

end
