class Admin::LinksController < AuthController
  before_action :set_admin_link, only: [:show, :edit, :update, :destroy]

  # GET /admin/links
  # GET /admin/links.json
  def index
    @admin_links = Admin::Link.all
  end

  # GET /admin/links/1
  # GET /admin/links/1.json
  def show
  end

  # GET /admin/links/new
  def new
    @admin_link = Admin::Link.new
    render layout: false
  end

  # GET /admin/links/1/edit
  def edit
    render layout: false
  end

  # POST /admin/links
  # POST /admin/links.json
  def create
    @admin_link = Admin::Link.new(admin_link_params)

    respond_to do |format|
      if @admin_link.save
        format.html { redirect_to admin_links_url , notice: "#{t 'activerecord.successful.messages.link_created'}" }
        format.json { render :show, status: :created, location: @admin_link }
      else
        format.html { render :new }
        format.json { render json: @admin_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/links/1
  # PATCH/PUT /admin/links/1.json
  def update
    respond_to do |format|
      if @admin_link.update(admin_link_params)
        format.html { redirect_to admin_links_url, notice: "#{t 'activerecord.successful.messages.link_updated'}" }
        format.json { render :show, status: :ok, location: @admin_link }
      else
        format.html { render :edit }
        format.json { render json: @admin_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/links/1
  # DELETE /admin/links/1.json
  def destroy
    @admin_link.destroy
    respond_to do |format|
      format.html { redirect_to admin_links_url, notice: "#{t 'activerecord.successful.messages.link_deleted'}" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_link
      @admin_link = Admin::Link.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_link_params
      params.require(:admin_link).permit(:name, :url, :logo)
    end
end
