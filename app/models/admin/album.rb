class Admin::Album < ActiveRecord::Base
	has_many :photo, dependent: :destroy
	
	has_attached_file :cover, 
                       styles: 	{ small: "240x240>"},
                       url: 	"/uploads/albums/cover/:id/:style/:basename.:extension",
                       path: 	":rails_root/public/uploads/albums/cover/:id/:style/:basename.:extension"
    validates_attachment :cover, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
