class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.token = @order.auth_token
    if @order.save
      flash[:notice] = t('orders.created')
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def order_params
    params.fetch(:order, {}).permit(order_items_attributes: [:id, :_destroy, :product_id, :count, :direction, product_attributes: [:id, :title]])
  end

  def is_admin?
    unless current_user.admin?
      redirect_to root_path
    end
  end
end
