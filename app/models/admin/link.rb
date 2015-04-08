class Admin::Link < ActiveRecord::Base
	has_attached_file :logo, 
                       styles: 	{ small: "160x160>"},
                       url: 	"/uploads/friend_links/:id/:style/:basename.:extension",
                       path: 	":rails_root/public/uploads/friend_links/:id/:style/:basename.:extension"
    validates_attachment :logo, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
