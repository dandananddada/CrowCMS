class Home::PageController < HomeController

	def about_us
		@page = Admin::Page.about_us
		respond_to do |format|
			format.html { render template: "home/page" }
		end
	end


	def contract_us
		@page = Admin::Page.contract_us
		respond_to do |format|
			format.html { render template: "home/page" }
		end
	end

end
