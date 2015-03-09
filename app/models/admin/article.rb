class Admin::Article < ActiveRecord::Base

	belongs_to :category
	has_many :article_picture, dependent: :destroy

	serialize :options

	validates :title, presence: true
	validates :category_id, presence: true
	validates :author, presence: true
	validates :content, presence: true
	
	has_attached_file :thumb, 
					  styles: { small: "150x150>"},
					  url: "/uploads/articles/thumb/:id/:style/:basename.:extension",
					  path: ":rails_root/public/uploads/articles/thumb/:id/:style/:basename.:extension"
	validates_attachment :thumb, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

	has_attached_file :file, 
					  url: "/uploads/articles/file/:id/:style/:basename.:extension",
					  path: ":rails_root/public/uploads/articles/file/:id/:style/:basename.:extension"
	validates_attachment :file, content_type: { content_type: ["application/pdf",					#pdf
															   "application/msword",				#word
															   "application/vnd.ms-excel",			#excel
															   "application/vnd.ms-powerpoint",		#ppt
															   "application/zip",					#zip
															   "application/x-shockwave-flash"		#swf
															  ]}
end
