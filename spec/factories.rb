FactoryGirl.define do
	factory :user do |f|
		f.email "admin@163.com"
		f.encrypted_password "$2a$10$jJNRjL9XlQr4zhxwGCLUceiVtSX9X9GPeTTdoSjCTQ7eWnrePXwcK"
	end
	factory :article_category, class: Admin::ArticleCategory do |f|
		f.title "article category title"
		f.is_article true
		f.is_thumb true
		is_file true
		is_abstract false
		is_carousel false
	end
end