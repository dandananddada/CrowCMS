class Api::CategoriesController < ApplicationController

	api! "get article categories"
	example " [
	{
		ancestry: null,
		id: 1,
		title: '信息中心',
		is_article: false,
		is_thumb: false,
		is_file: false,
		is_abstract: false,
		is_carousel: false,
		is_option: null,
		option_keys: null,
		created_at: '2015-03-27T15:15:54.000+08:00',
		updated_at: '2015-03-27T15:15:54.000+08:00',
		children: [
			{
				ancestry: '1',
				id: 2,
				title: '新闻',
				is_article: true,
				is_thumb: false,
				is_file: true,
				is_abstract: true,
				is_carousel: false,
				is_option: null,
				option_keys: null,
				created_at: '2015-03-27T15:15:54.000+08:00',
				updated_at: '2015-03-27T15:15:54.000+08:00',
				children: [ ]
			},{
				ancestry: '1',
				id: 3,
				title: '公告',
				is_article: true,
				is_thumb: false,
				is_file: true,
				is_abstract: true,
				is_carousel: false,
				is_option: null,
				option_keys: null,
				created_at: '2015-03-27T15:15:54.000+08:00',
				updated_at: '2015-03-27T15:15:54.000+08:00',
				children: [ ]
			}
		]},{ 
			...
	 	}
	 ]"
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
