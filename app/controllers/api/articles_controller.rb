class Api::ArticlesController < ApplicationController

	def index
		begin
			@articles = Admin::Article.all
		rescue Exception => e
			render nothing: true 
		else
			render json: @articles 
		end
	end

	def show
		begin
			@article = Admin::Article.find(params[:id])
		rescue Exception => e
			render nothing: true 
		else
			render json: @article 
		end
	end

	def search_by_title
		begin
			@articles = Admin::Article.where("title like ?", "%#{params[:title]}%")
		rescue Exception => e
			render nothing: true 
		else
			render json: @articles 
		end
		
	end
end

