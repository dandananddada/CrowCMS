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
  	redirect_to admin_trash_articles_url, notice: "#{t 'activerecord.successful.messages.article_force_deleted'}" 
  end

  def multi_destroy
    respond_to do |format|
      if params[:article_ids] == nil
        format.html { redirect_to admin_trash_articles_url, flash: { error: "#{t 'activerecord.error.messages.article_muti_deleted'}" }  }
        format.json { head :no_content }
      else  
        articles = Admin::Article.only_deleted.find(params[:article_ids])
        articles.each do |article|
          article.really_destroy!
        end
        format.html { redirect_to admin_trash_articles_url, notice: "#{t 'activerecord.successful.messages.article_muti_deleted'}" }
        format.json { head :no_content }
      end
    end
  end

end
