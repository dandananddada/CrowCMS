class Admin::ArticleCategory < ActiveRecord::Base
	has_ancestry
	has_many :article, dependent: :destroy
end
