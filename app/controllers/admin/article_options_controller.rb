class Admin::ArticleOptionsController < AuthController
  before_action :set_admin_article_option, only: [:show, :edit, :update, :destroy]

  # GET /admin/article_options
  # GET /admin/article_options.json
  def index
    @admin_article_options = Admin::ArticleOption.all
  end

  # GET /admin/article_options/1
  # GET /admin/article_options/1.json
  def show
  end

  # GET /admin/article_options/new
  def new
    @admin_article_option = Admin::ArticleOption.new
     render layout: false
  end

  # GET /admin/article_options/1/edit
  def edit
     render layout: false
  end

  # POST /admin/article_options
  # POST /admin/article_options.json
  def create
    @admin_article_option = Admin::ArticleOption.new(admin_article_option_params)

    respond_to do |format|
      if @admin_article_option.save
        format.html { redirect_to admin_article_options_url, notice: "#{ t 'activerecord.successful.messages.article_option_created'}" }
        format.json { render :index, status: :created, location: @admin_article_option }
      else
        format.html { redirect_to admin_article_options_url, flash: { error: "#{t 'activerecord.error.messages.article_option_created'}" } }
        format.json { render json: @admin_article_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/article_options/1
  # PATCH/PUT /admin/article_options/1.json
  def update
    respond_to do |format|
      if @admin_article_option.update(admin_article_option_params)
        format.html { redirect_to admin_article_options_url, notice: "#{ t 'activerecord.successful.messages.article_option_updated'}"  }
        format.json { render :index, status: :ok, location: @admin_article_option }
      else
        format.html { redirect_to admin_article_options_url, flash: { error: "#{t 'activerecord.error.messages.article_option_updated'}" } }
        format.json { render json: @admin_article_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/article_options/1
  # DELETE /admin/article_options/1.json
  def destroy
    @admin_article_option.destroy
    respond_to do |format|
      format.html { redirect_to admin_article_options_url, notice: "#{ t 'activerecord.successful.messages.article_option_deleted'}"  }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_article_option
      @admin_article_option = Admin::ArticleOption.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_article_option_params
      params.require(:admin_article_option).permit(:text)
    end
end
