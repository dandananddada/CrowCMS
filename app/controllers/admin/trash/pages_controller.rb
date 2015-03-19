class Admin::Trash::PagesController < ApplicationController
   def index
  	@admin_trush_pages = Admin::Page.only_deleted
  end

  def restore
  	Admin::Page.restore(params[:id])
  	redirect_to admin_pages_url, notice: "#{t 'activerecord.successful.messages.page_restored'}"
  end

  def destroy
  	page = Admin::Page.only_deleted.find(params[:id])
    page.really_destroy!
  	redirect_to admin_trash_pages_url, notice: "#{t 'activerecord.successful.messages.page_force_deleted'}" 
  end
end
