class Admin::ArticlePicture < ActiveRecord::Base
    belongs_to :article
    
  	has_attached_file :picture, 
					  styles: { small: "150x150>"},
					  url: "/uploads/articles/pictures/:id/:style/:basename.:extension",
					  path: ":rails_root/public/uploads/articles/pictures/:id/:style/:basename.:extension"
	validates_attachment :picture, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
