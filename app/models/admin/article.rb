class Admin::Article < ActiveRecord::Base

	belongs_to :category
	has_many :article_picture, dependent: :destroy
	acts_as_paranoid	#for soft delete

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
	validates_attachment :file, 
				  	content_type: { content_type:["application/pdf",															    #pdf
												  "application/msword",														    #doc
												  "application/vnd.openxmlformats-officedocument.wordprocessingml.document",      #docx
												  "application/vnd.ms-excel",													    #excel
												  "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",		    #xlsx
												  "application/vnd.ms-powerpoint",											    #ppt
												  "application/vnd.openxmlformats-officedocument.presentationml.presentation",    #pptx
												  "application/zip",															    #zip
												  "application/x-shockwave-flash"												    #swf
												   ]}

	scope :news_for_home,     -> { where(category_id: 2).limit(10).order('id asc') }	
	scope :notices_for_home,  -> { where(category_id: 3).limit(10).order('id asc') }	
	scope :products_for_home, -> { where(category_id: 5).limit(5).order('id asc') }	
	scope :news_for_list,     -> { where(category_id: 2).order('id asc') }	
	scope :notices_for_list,  -> { where(category_id: 3).order('id asc') }	
	scope :products_for_list, -> { where(category_id: 5).order('id asc') }										

end
