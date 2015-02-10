class Admin::ArticlesController < AuthController
  before_action :set_admin_article, only: [:show, :edit, :update, :destroy]

  # GET /admin/articles
  # GET /admin/articles.json
  def index
    @admin_articles = Admin::Article.all
  end

  # GET /admin/articles/1
  # GET /admin/articles/1.json
  def show
  end

  # GET /admin/articles/new
  def new
    @admin_article_categories = Admin::ArticleCategory.all
    @admin_article = Admin::Article.new
  end

  # GET /admin/articles/1/edit
  def edit
     @admin_article_categories = Admin::ArticleCategory.all
  end

  # POST /admin/articles
  # POST /admin/articles.json
  def create
    @admin_article = Admin::Article.new(admin_article_params)

    respond_to do |format|
      if @admin_article.save
        format.html { redirect_to @admin_article, notice: "#{t 'activerecord.successful.messages.article_created'}" }
        format.json { render :show, status: :created, location: @admin_article }
        # format.js { render :show, status: :created, location: @admin_article }
      else
        @admin_article_categories = Admin::ArticleCategory.all
        format.html { render :new }
        format.json { render json: @admin_article.errors, status: :unprocessable_entity }
        # format.js { render json: @admin_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/articles/1
  # PATCH/PUT /admin/articles/1.json
  def update
    respond_to do |format|
      if @admin_article.update(admin_article_params)
        format.html { redirect_to @admin_article, notice: "#{t 'activerecord.successful.messages.article_updated'}" }
        format.json { render :show, status: :ok, location: @admin_article }
      else
        format.html { render :edit }
        format.json { render json: @admin_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/articles/1
  # DELETE /admin/articles/1.json
  def destroy
    @admin_article.destroy
    respond_to do |format|
      format.html { redirect_to admin_articles_url, notice: "#{t 'activerecord.successful.messages.article_deleted'}" }
      format.json { head :no_content }
    end
  end

  def article_concat
    @article_concat = Admin::ArticleCategory.find(params[:id])
    render json: @article_concat
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_article
      @admin_article = Admin::Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_article_params
      params.require(:admin_article).permit(:title, :article_category_id, :author, :is_recommand, :is_carousel, :is_mark, :content, :abstract, :thumb, :file, :hits)
    end
end
