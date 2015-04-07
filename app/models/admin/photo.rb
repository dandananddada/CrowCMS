class Admin::Photo < ActiveRecord::Base
	belongs_to :album
	validates_length_of :name, maximum: 16
	has_attached_file :image, 
					  styles: { small: "160x160>"},
					  url: "/uploads/albums/photos/:id/:style/:basename.:extension",
					  path: ":rails_root/public/uploads/albums/photos/:id/:style/:basename.:extension"
					  validates_attachment :image, 	content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

	#scope :photos_for_album, -> { where("album_id = ?", album_id  }
end
