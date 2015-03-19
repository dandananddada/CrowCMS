class Admin::AlbumTag < ActiveRecord::Base
	validates :text, presence: true, uniqueness: true
	validates_length_of :text, maximum: 12
end
