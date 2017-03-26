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
    p ['!!!! params', order_params]
    p ['!!! order', @order]
    p ['!!! order', @order.order_items]
    p ['!!! order', @order.products]
    if @order.save
      p ['!!!!!!!!!!!', 'save']
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
