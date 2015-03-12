class Admin::CategoriesController < AuthController
  before_action :set_admin_category, only: [:show, :edit, :update, :destroy]

  # product options
  
  # GET /admin/article_categories
  # GET /admin/article_categories.json
  def index
    @admin_categories = Admin::Category.all
  end

  # GET /admin/article_categories/1
  # GET /admin/article_categories/1.json
  def show
    get_options
  end

  # GET /admin/article_categories/new
  def new
    get_options
    if (params[:id] == '0')
      @admin_category = Admin::Category.new
    else
      @admin_category = Admin::Category.new(:parent_id => params[:id])
    end
   
  end

  # GET /admin/article_categories/1/edit
  def edit
    get_options
  end

  # POST /admin/article_categories
  # POST /admin/article_categories.json
  def create
    @admin_category = Admin::Category.new(admin_category_params)

    respond_to do |format|
      if @admin_category.save
        format.html { redirect_to @admin_category, notice: "#{t 'activerecord.successful.messages.article_category_created'}" }
        format.json { render :show, status: :created, location: @admin_category }
      else
        get_options
        format.html { render :new }
        format.json { render json: @admin_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/article_categories/1
  # PATCH/PUT /admin/article_categories/1.json
  def update
    respond_to do |format|
      if @admin_category.update(admin_category_params)
        format.html { redirect_to @admin_category, notice: "#{t 'activerecord.successful.messages.article_category_updated'}" }
        format.json { render :show, status: :ok, location: @admin_category }
      else
        get_options
        format.html { render :edit }
        format.json { render json: @admin_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/article_categories/1
  # DELETE /admin/article_categories/1.json
  def destroy
    @admin_category.destroy
    respond_to do |format|
      format.html { redirect_to admin_categories_url, notice: "#{t 'activerecord.successful.messages.article_category_deleted'}" }
      format.json { head :no_content }
    end
  end

  private
    def get_options
      @options = Admin::ArticleOption.all
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_admin_category
      @admin_category = Admin::Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_category_params
      params.require(:admin_category).permit(:parent_id, :title, :is_article, :is_thumb, :is_file, :is_abstract, :is_carousel, :is_option, :option_keys)
    end
end
