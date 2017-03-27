class WelcomeController < ApplicationController
  def search
    @order = Order.find_by('token = ?', params['/show'][:search])
    if !@order.nil?
      @order_item = OrderItem.where('order_id = ?', @order.id)
    else
      flash[:error] = t('orders.not_found')
      redirect_to root_path
    end
  end
end
