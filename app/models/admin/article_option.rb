class Admin::ArticleOption < ActiveRecord::Base
	validates :text, presence: true, uniqueness: true
	validates :text, format: { with: /\D/, message: "should not be number" }
	validates_length_of :text, maximum: 12
end
