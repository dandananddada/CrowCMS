class Admin::Album < ActiveRecord::Base
	validates_length_of :name, maximum: 24
	has_many :photo, dependent: :destroy
	has_attached_file :cover, 
                       styles: 	{ small: "160x160>"},
                       url: 	"/uploads/albums/cover/:id/:style/:basename.:extension",
                       path: 	":rails_root/public/uploads/albums/cover/:id/:style/:basename.:extension"
    validates_attachment :cover, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

   	scope :albums_for_home,    -> { all.limit(4).order('id asc') }	

end
