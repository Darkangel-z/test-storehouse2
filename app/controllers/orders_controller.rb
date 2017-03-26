class OrdersController < ApplicationController
  def index
     @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    @products = Product.all
  end

  def create
    @order = Order.new(order_params)
    @order.token = @order.auth_token
    if @order.save
      flash[:notice] = t('orders.created')
      redirect_to root_path
    else
      @products = Product.all
      render :new
    end
  end

  private
  def order_params
    params.fetch(:order, {}).permit(:title, order_items_attributes: [:id, :_destroy, :product_id, :count, :direction, product_attributes: [:id, :title]])
  end
end
