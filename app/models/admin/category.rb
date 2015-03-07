class Admin::Category < ActiveRecord::Base
	has_ancestry
	has_many :article, dependent: :destroy

	validates :title, presence: true 

	scope :select_article_categories, -> { where(is_article: true) }
end
