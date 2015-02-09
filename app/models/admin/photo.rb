class Admin::Photo < ActiveRecord::Base
	belongs_to :album
	has_attached_file :image, 
	styles: { small: "160x160>"},
	url: "/uploads/albums/photos/:id/:style/:basename.:extension",
	path: ":rails_root/public/uploads/albums/photos/:id/:style/:basename.:extension"
	validates_attachment :image, 	content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
