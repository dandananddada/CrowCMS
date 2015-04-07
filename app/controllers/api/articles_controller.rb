class Api::ArticlesController < ApplicationController

	api :GET, '/articles', "get all articles"
	example " [{
				id: 2,
				category_id: 2,
				title: '测试新闻',
				author: '管理员',
				is_recommand: false,
				is_carousel: false,
				is_mark: false,
				options: '{}',
				content: '<p>测试新闻</p> ',
				abstract: '',
				hits: 0,
				created_at: '2015-03-27T15:17:42.000+08:00',
				updated_at: '2015-03-27T15:17:42.000+08:00',
				deleted_at: null,
				thumb_file_name: null,
				thumb_content_type: null,
				thumb_file_size: null,
				thumb_updated_at: null,
				file_file_name: null,
				file_content_type: null,
				file_file_size: null,
				file_updated_at: null
			},{...}] "
	def index
		begin
			@articles = Admin::Article.all
		rescue Exception => e
			render nothing: true 
		else
			render json: @articles 
		end
	end

	api! "get article by specificy id"
	param :id, String, :desc => "article ID", :required => true
	example "
		{
			id: 3,
			category_id: 2,
			title: '测试新闻',
			author: '管理员',
			is_recommand: false,
			is_carousel: false,
			is_mark: false,
			options: '{}',
			content: '<p>这个在上面</p> ',
			abstract: '',
			hits: 0,
			created_at: '2015-03-27T15:18:01.000+08:00',
			updated_at: '2015-03-27T15:18:01.000+08:00',
			deleted_at: null,
			thumb_file_name: null,
			thumb_content_type: null,
			thumb_file_size: null,
			thumb_updated_at: null,
			file_file_name: null,
			file_content_type: null,
			file_file_size: null,
			file_updated_at: null
		}"
	def show
		begin
			@article = Admin::Article.find(params[:id])
		rescue Exception => e
			render nothing: true 
		else
			render json: @article 
		end
	end

	api! "search articles by title"
	param :title, String, :desc => "article title", :required => false
	example "
		{
			id: 3,
			category_id: 2,
			title: '测试新闻',
			author: '管理员',
			is_recommand: false,
			is_carousel: false,
			is_mark: false,
			options: '{}',
			content: '<p>这个在上面</p> ',
			abstract: '',
			hits: 0,
			created_at: '2015-03-27T15:18:01.000+08:00',
			updated_at: '2015-03-27T15:18:01.000+08:00',
			deleted_at: null,
			thumb_file_name: null,
			thumb_content_type: null,
			thumb_file_size: null,
			thumb_updated_at: null,
			file_file_name: null,
			file_content_type: null,
			file_file_size: null,
			file_updated_at: null
		}"
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

