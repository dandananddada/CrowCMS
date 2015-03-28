class Home::ArticleController < HomeController

	def show
		@article = Admin::Article.find(params[:id])
		respond_to do |format|
			format.html { render :template => "home/article" }
		end
	end

end
