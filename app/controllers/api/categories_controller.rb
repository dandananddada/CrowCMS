class Api::CategoriesController < ApplicationController
	def index
		begin
			@categories = Admin::Category.arrange_serializable(:order => :id)
		rescue Exception => e
			render nothing: true 
		else
			render json: @categories 
		end
	end

	def show
		begin
			@category = Admin::Category.find(params[:id])
		rescue Exception => e
			render nothing: true 
		else
			render json: @category 
		end
	end
	
end
