class Admin::ArticlePicturesController < AuthController
  before_action :set_admin_article_picture, only: [:show, :edit, :update, :destroy]

  # GET /admin/article_pictures
  # GET /admin/article_pictures.json
  def index
   @admin_article_picture = Admin::ArticlePicture.new(article_id: params[:id])
   @admin_article_pictures = Admin::ArticlePicture.where(article_id: params[:id])
  end

  # GET /admin/article_pictures/1
  # GET /admin/article_pictures/1.json
  # def show
  # end

  # GET /admin/article_pictures/new
  # def new
  #   @admin_article_picture = Admin::ArticlePicture.new(article_id: params[:article_id])
  #   @admin_article_pictures = Admin::ArticlePicture.where(article_id: params[:article_id])
  # end

  # GET /admin/article_pictures/1/edit
  # def edit
  # end

  # POST /admin/article_pictures
  # POST /admin/article_pictures.json
  def create
    @admin_article_picture = Admin::ArticlePicture.new(admin_article_picture_params)

    respond_to do |format|
      if @admin_article_picture.save
        format.js { render :aaa, status: :created, location: @admin_article_picture }
        format.html { redirect_to @admin_article_picture, notice: 'Article picture was successfully created.' }
        format.json { render :show, status: :created, location: @admin_article_picture }
      else
        format.html { render :new }
        format.json { render json: @admin_article_picture.errors, status: :unprocessable_entity }
        format.js { render json: @admin_article_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/article_pictures/1
  # PATCH/PUT /admin/article_pictures/1.json
  # def update
  #   respond_to do |format|
  #     if @admin_article_picture.update(admin_article_picture_params)
  #       format.html { redirect_to @admin_article_picture, notice: 'Article picture was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @admin_article_picture }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @admin_article_picture.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /admin/article_pictures/1
  # DELETE /admin/article_pictures/1.json
  def destroy
    @admin_article_picture.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Article picture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_article_picture
      @admin_article_picture = Admin::ArticlePicture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_article_picture_params
      params.require(:admin_article_picture).permit(:article_id,:picture)
    end
end
