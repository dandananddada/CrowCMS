class Admin::ArticleCategoriesController < AuthController
  before_action :set_admin_article_category, only: [:show, :edit, :update, :destroy]

  # GET /admin/article_categories
  # GET /admin/article_categories.json
  def index
    @admin_article_categories = Admin::ArticleCategory.all
  end

  # GET /admin/article_categories/1
  # GET /admin/article_categories/1.json
  def show
  end

  # GET /admin/article_categories/new
  def new
    if (params[:id] == '0')
      @admin_article_category = Admin::ArticleCategory.new
    else
      @admin_article_category = Admin::ArticleCategory.new(:parent_id => params[:id])
    end
   
  end

  # GET /admin/article_categories/1/edit
  def edit
  end

  # POST /admin/article_categories
  # POST /admin/article_categories.json
  def create
    @admin_article_category = Admin::ArticleCategory.new(admin_article_category_params)

    respond_to do |format|
      if @admin_article_category.save
        format.html { redirect_to @admin_article_category, notice: "#{t 'activerecord.successful.messages.article_category_created'}" }
        format.json { render :show, status: :created, location: @admin_article_category }
      else
        format.html { render :new }
        format.json { render json: @admin_article_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/article_categories/1
  # PATCH/PUT /admin/article_categories/1.json
  def update
    respond_to do |format|
      if @admin_article_category.update(admin_article_category_params)
        format.html { redirect_to @admin_article_category, notice: "#{t 'activerecord.successful.messages.article_category_updated'}" }
        format.json { render :show, status: :ok, location: @admin_article_category }
      else
        format.html { render :edit }
        format.json { render json: @admin_article_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/article_categories/1
  # DELETE /admin/article_categories/1.json
  def destroy
    @admin_article_category.destroy
    respond_to do |format|
      format.html { redirect_to admin_article_categories_url, notice: "#{t 'activerecord.successful.messages.article_category_deleted'}" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_article_category
      @admin_article_category = Admin::ArticleCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_article_category_params
      params.require(:admin_article_category).permit(:parent_id, :title, :is_article, :is_thumb, :is_file, :is_abstract, :is_carousel)
    end
end
