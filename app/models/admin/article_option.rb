class Admin::ArticleOption < ActiveRecord::Base
	validates :text, presence: true, uniqueness: true
	validates :text, format: { with: /\D/, message: "should not be number" }
end
