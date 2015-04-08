class Admin::Banner < ActiveRecord::Base
	 
	 has_attached_file :banner, 
                       styles: { small: "150x150>"},
                       url: "/uploads/banners/:id/:style/:basename.:extension",
                       path: ":rails_root/public/uploads/banners/:id/:style/:basename.:extension"
    validates_attachment :banner, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

end
