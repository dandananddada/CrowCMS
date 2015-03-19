class Admin::AlbumTagsController < AuthController
  before_action :set_admin_album_tag, only: [:show, :edit, :update, :destroy]

  # GET /admin/album_tags
  # GET /admin/album_tags.json
  def index
    @admin_album_tags = Admin::AlbumTag.all
  end

  # GET /admin/album_tags/1
  # GET /admin/album_tags/1.json
  def show
  end

  # GET /admin/album_tags/new
  def new
    @admin_album_tag = Admin::AlbumTag.new
    render layout: false
  end

  # GET /admin/album_tags/1/edit
  def edit
    render layout: false
  end

  # POST /admin/album_tags
  # POST /admin/album_tags.json
  def create
    @admin_album_tag = Admin::AlbumTag.new(admin_album_tag_params)

    respond_to do |format|
      if @admin_album_tag.save
        format.html { redirect_to admin_album_tags_url, notice: "#{t 'activerecord.successful.messages.album_tag_created'}" }
        format.json { render :show, status: :created, location: @admin_album_tag }
      else
        format.html { redirect_to admin_album_tags_url, flash: { error: "#{t 'activerecord.error.messages.album_tag_created'}" } }
        format.json { render json: @admin_album_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/album_tags/1
  # PATCH/PUT /admin/album_tags/1.json
  def update
    respond_to do |format|
      if @admin_album_tag.update(admin_album_tag_params)
        format.html { redirect_to admin_album_tags_url, notice: "#{t 'activerecord.successful.messages.album_tag_updated'}" }
        format.json { render :show, status: :ok, location: @admin_album_tag }
      else
        format.html { redirect_to admin_album_tags_url, flash: { error: "#{t 'activerecord.error.messages.album_tag_updated'}" } }
        format.json { render json: @admin_album_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/album_tags/1
  # DELETE /admin/album_tags/1.json
  def destroy
    @admin_album_tag.destroy
    respond_to do |format|
      format.html { redirect_to admin_album_tags_url, notice: "#{t 'activerecord.successful.messages.album_tag_deleted'}" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_album_tag
      @admin_album_tag = Admin::AlbumTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_album_tag_params
      params.require(:admin_album_tag).permit(:text)
    end
end
