class Admin::ProductOptionsController < ApplicationController
  before_action :set_admin_product_option, only: [:show, :edit, :update, :destroy]

  # GET /admin/product_options
  # GET /admin/product_options.json
  def index
    @admin_product_options = Admin::ProductOption.all
  end

  # GET /admin/product_options/1
  # GET /admin/product_options/1.json
  def show
  end

  # GET /admin/product_options/new
  def new
    @admin_product_option = Admin::ProductOption.new
     render layout: false
  end

  # GET /admin/product_options/1/edit
  def edit
     render layout: false
  end

  # POST /admin/product_options
  # POST /admin/product_options.json
  def create
    @admin_product_option = Admin::ProductOption.new(admin_product_option_params)

    respond_to do |format|
      if @admin_product_option.save
        format.html { redirect_to admin_product_options_url, notice: "#{ t 'activerecord.successful.messages.product_option_created'}" }
        format.json { render :index, status: :created, location: @admin_product_option }
      else
        format.html { render :new }
        format.json { render json: @admin_product_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/product_options/1
  # PATCH/PUT /admin/product_options/1.json
  def update
    respond_to do |format|
      if @admin_product_option.update(admin_product_option_params)
        format.html { redirect_to admin_product_options_url, notice: "#{ t 'activerecord.successful.messages.product_option_updated'}"  }
        format.json { render :index, status: :ok, location: @admin_product_option }
      else
        format.html { render :edit }
        format.json { render json: @admin_product_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/product_options/1
  # DELETE /admin/product_options/1.json
  def destroy
    @admin_product_option.destroy
    respond_to do |format|
      format.html { redirect_to admin_product_options_url, notice: "#{ t 'activerecord.successful.messages.product_option_deleted'}"  }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_product_option
      @admin_product_option = Admin::ProductOption.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_product_option_params
      params.require(:admin_product_option).permit(:text)
    end
end
