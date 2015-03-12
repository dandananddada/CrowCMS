class Admin::PagesController < AuthController
  before_action :set_admin_page, only: [:show, :edit, :update, :destroy]

  # GET /admin/pages
  # GET /admin/pages.json
  def index
    @admin_pages = Admin::Page.all
  end

  # GET /admin/pages/1
  # GET /admin/pages/1.json
  def show
  end

  # GET /admin/pages/new
  def new
    @admin_page = Admin::Page.new
  end

  # GET /admin/pages/1/edit
  def edit
  end

  # POST /admin/pages
  # POST /admin/pages.json
  def create
    @admin_page = Admin::Page.new(admin_page_params)

    respond_to do |format|
      if @admin_page.save
        format.html { redirect_to @admin_page, notice: "#{t 'activerecord.successful.messages.page_created'}" }
        format.json { render :show, status: :created, location: @admin_page }
      else
        format.html { render :new }
        format.json { render json: @admin_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/pages/1
  # PATCH/PUT /admin/pages/1.json
  def update
    respond_to do |format|
      if @admin_page.update(admin_page_params)
        format.html { redirect_to @admin_page, notice: "#{t 'activerecord.successful.messages.page_updated'}" }
        format.json { render :show, status: :ok, location: @admin_page }
      else
        format.html { render :edit }
        format.json { render json: @admin_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/pages/1
  # DELETE /admin/pages/1.json
  def destroy
    @admin_page.destroy
    respond_to do |format|
      format.html { redirect_to admin_pages_url, notice: "#{t 'activerecord.successful.messages.page_deleted'}" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_page
      @admin_page = Admin::Page.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_page_params
      params.require(:admin_page).permit(:title, :abstract, :content)
    end
end
