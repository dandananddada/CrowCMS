FactoryGirl.define do
	factory :user do |f|
		f.email "admin@163.com"
		f.encrypted_password "$2a$10$jJNRjL9XlQr4zhxwGCLUceiVtSX9X9GPeTTdoSjCTQ7eWnrePXwcK"
	end
	factory :article_category, class: Admin::ArticleCategory do |f|
		f.id 1
		f.ancestry nil
		f.title "article category title"
		f.is_article true
		f.is_thumb true
		is_file true
		is_abstract false
		is_carousel false
	end
	factory :article, class: Admin::Article do |f|
		f.id 1
		f.title "your article title"
		f.article_category_id 1
		f.author "author"
		f.content "<p>your article content</p>"
	end
	factory :page, class: Admin::Page do |f|
		f.id 1
		f.title "your article title"
		f.content "<p>your article content</p>"
	end
	factory :product_option, class: Admin::ProductOption do |f|
		f.id 1
		f.text "your article title"
	end
end