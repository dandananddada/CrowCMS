class Admin::Page < ActiveRecord::Base
	acts_as_paranoid	#for soft delete
	validates :title, presence: true 
	validates :content, presence: true 

	scope :about_us, -> { find(1) }
	scope :contract_us, -> { find(2) }
end
