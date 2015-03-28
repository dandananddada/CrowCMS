class Admin::FriendLinksController < ApplicationController
  before_action :set_admin_friend_link, only: [:show, :edit, :update, :destroy]

  # GET /admin/friend_links
  # GET /admin/friend_links.json
  def index
    @admin_friend_links = Admin::FriendLink.all
  end

  # GET /admin/friend_links/1
  # GET /admin/friend_links/1.json
  def show
  end

  # GET /admin/friend_links/new
  def new
    @admin_friend_link = Admin::FriendLink.new
    render layout: false
  end

  # GET /admin/friend_links/1/edit
  def edit
    render layout: false
  end

  # POST /admin/friend_links
  # POST /admin/friend_links.json
  def create
    @admin_friend_link = Admin::FriendLink.new(admin_friend_link_params)

    respond_to do |format|
      if @admin_friend_link.save
        format.html { redirect_to admin_friend_links_url , notice: "#{t 'activerecord.successful.messages.friend_link_created'}" }
        format.json { render :show, status: :created, location: @admin_friend_link }
      else
        format.html { render :new }
        format.json { render json: @admin_friend_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/friend_links/1
  # PATCH/PUT /admin/friend_links/1.json
  def update
    respond_to do |format|
      if @admin_friend_link.update(admin_friend_link_params)
        format.html { redirect_to admin_friend_links_url, notice: "#{t 'activerecord.successful.messages.friend_link_updated'}" }
        format.json { render :show, status: :ok, location: @admin_friend_link }
      else
        format.html { render :edit }
        format.json { render json: @admin_friend_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/friend_links/1
  # DELETE /admin/friend_links/1.json
  def destroy
    @admin_friend_link.destroy
    respond_to do |format|
      format.html { redirect_to admin_friend_links_url, notice: "#{t 'activerecord.successful.messages.friend_link_deleted'}" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_friend_link
      @admin_friend_link = Admin::FriendLink.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_friend_link_params
      params.require(:admin_friend_link).permit(:name, :url, :logo)
    end
end
