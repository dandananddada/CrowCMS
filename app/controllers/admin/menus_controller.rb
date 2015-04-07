class Admin::MenusController < AuthController
  before_action :set_admin_menu, only: [:show, :edit, :update, :destroy]

  # GET /admin/menus
  # GET /admin/menus.json
  def index
    @admin_menus = Admin::Menu.all
  end

  # GET /admin/menus/1
  # GET /admin/menus/1.json
  def show
  end

  # GET /admin/menus/new
  def new
    if (params[:id] == '0')
      @admin_menu = Admin::Menu.new
    else
      @admin_menu = Admin::Menu.new(:parent_id => params[:id])
    end
    render layout: false
  end

  # GET /admin/menus/1/edit
  def edit
    render layout: false
  end

  # POST /admin/menus
  # POST /admin/menus.json
  def create
    @admin_menu = Admin::Menu.new(admin_menu_params)

    respond_to do |format|
      if @admin_menu.save
        format.html { redirect_to admin_menus_url, notice: "#{ t 'activerecord.successful.messages.menu_created'}" }
        format.json { render :show, status: :created, location: @admin_menu }
      else
        format.html { render :new }
        format.json { render json: @admin_menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/menus/1
  # PATCH/PUT /admin/menus/1.json
  def update
    respond_to do |format|
      if @admin_menu.update(admin_menu_params)
        format.html { redirect_to admin_menus_url, notice: "#{ t 'activerecord.successful.messages.menu_updated'}" }
        format.json { render :show, status: :ok, location: @admin_menu }
      else
        format.html { render :edit }
        format.json { render json: @admin_menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/menus/1
  # DELETE /admin/menus/1.json
  def destroy
    @admin_menu.destroy
    respond_to do |format|
      format.html { redirect_to admin_menus_url, notice: "#{ t 'activerecord.successful.messages.menu_deleted'}" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_menu
      @admin_menu = Admin::Menu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_menu_params
      params.require(:admin_menu).permit(:name, :url, :parent_id, :weight, :visible)
    end
end
