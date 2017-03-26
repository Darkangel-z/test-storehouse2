class ProductsController < ApplicationController
  def index
     @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = t('products.created')
      redirect_to action: :index
    else
      render :new
    end
  end

private
def product_params
  params.require(:product).permit(:title, :image)
end
end
