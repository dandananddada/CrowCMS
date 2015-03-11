class Admin::ArticleOption < ActiveRecord::Base
	validates :text, presence: true, uniqueness: true 
end
