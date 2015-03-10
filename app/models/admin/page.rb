class Admin::Page < ActiveRecord::Base
	acts_as_paranoid	#for soft delete
	validates :title, presence: true 
	validates :content, presence: true 
end
