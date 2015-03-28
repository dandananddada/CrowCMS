class Home::IndexController < HomeController
	
	def index
		@news = Admin::Article.news_for_home
		@notices = Admin::Article.notices_for_home
	end
end
