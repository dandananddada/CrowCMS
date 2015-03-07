class Admin::ProductOption < ActiveRecord::Base
	validates :text, presence: true 
end
