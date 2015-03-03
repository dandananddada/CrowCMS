class Admin::ArticleCategory < ActiveRecord::Base
	has_ancestry
	has_many :article, dependent: :destroy

	scope :select_article_categories, -> { where(is_article: 1) }
end
