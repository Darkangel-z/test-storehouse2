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

  def update
    if @product.update(product_params)
      flash[:notice] = t('products.updted')
      redirect_to action: :index
    else
      render :edit
    end
  end

  private
  def product_params
    params.require(:product).permit(:title, :image)
  end
end
