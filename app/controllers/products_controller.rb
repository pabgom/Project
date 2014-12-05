class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
	before_filter :authenticate_user!

  respond_to :html

  def index
    @products = Product.all
    respond_with(@products)
  end

  def show
		@CategoryName = ''
		#if(@product.Category?)
			#@CategoryName = @product.Category.Name	
		#end
    respond_with(@product)
  end

  def new
    @product = Product.new
		@categories = Category.all
    respond_with(@product)
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    @product.save
    respond_with(@product)
  end

  def update
    @product.update(product_params)
    respond_with(@product)
  end

  def destroy
    @product.destroy
    respond_with(@product)
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:Name, :Description, :Img_url, :Price, :Category_id)
    end
end
