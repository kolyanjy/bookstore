class OrderItemsController < ApplicationController
  before_action :setup_order_item

  def create
    OrderItems::Create.call(params: permitted_params, current_order: current_order)
    session[:order_id] = current_order.id
  end

  def destroy
    @order_item.destroy
    redirect_to cart_path(current_order), flash: { success: t('order_item.success_delete') }
  end

  def increment_quantity
    @order_item.increment!(:quantity)
    redirect_to cart_path(current_order), flash: { success: t('order_item.success_update') }
  end

  def decrement_quantity
    if @order_item.quantity == 1
      redirect_to cart_path(current_order), flash: { danger: t('order_item.error_update') }
    else
      @order_item.decrement!(:quantity)
      redirect_to cart_path(current_order), flash: { success: t('order_item.success_update') }
    end
  end

  private

  def setup_order_item
    @order_item ||= OrderItem.find_by(id: params[:id])
  end

  def permitted_params
    params.require(:order_items).permit(:quantity, :book_id)
  end
end
