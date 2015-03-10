class Admin::Trash::ArticlesController < ApplicationController
  def index
  	@admin_trush_articles = Admin::Article.only_deleted
  end

  def restore
  	Admin::Article.restore(params[:id])
  	redirect_to admin_articles_url, notice: "#{t 'activerecord.successful.messages.article_restored'}"
  end

  def destroy
  	article = Admin::Article.only_deleted.find(params[:id])
    article.really_destroy!
  	redirect_to admin_articles_url, notice: "#{t 'activerecord.successful.messages.article_force_deleted'}" 
  end
end
