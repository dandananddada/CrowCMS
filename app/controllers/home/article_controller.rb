class Home::ArticleController < HomeController

	def news
		@articles = Admin::Article.news_for_list
		respond_to do |format|
			format.html { render :template => "home/list" }
		end
	end

	def notices
		@articles = Admin::Article.notices_for_list
		respond_to do |format|
			format.html { render :template => "home/list" }
		end
	end

	def products
		@articles = Admin::Article.products_for_list
		respond_to do |format|
			format.html { render :template => "home/list" }
		end
	end


	def show
		@article = Admin::Article.find(params[:id])
		respond_to do |format|
			format.html { render :template => "home/article" }
		end
	end

	def product
		@article = Admin::Article.find(params[:id])
		respond_to do |format|
			format.html { render :template => "home/product" }
		end
	end

end
