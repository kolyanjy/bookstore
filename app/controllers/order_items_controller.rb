class OrderItemsController < ApplicationController
  before_action :setup_order_item, except: [:create]

  def create
    result = OrderItems::Create.call(params: permitted_params, current_order: current_order)
    if result.success?
      redirect_back(fallback_location: root_path, notice: t('order_item.success_update'))
    else
      redirect_to cart_path, flash: { danger: t('order_item.error_update') }
    end
    session[:order_id] ||= current_order.id
  end

  def destroy
    @order_item.destroy
    redirect_to cart_path, flash: { success: t('order_item.success_delete') }
  end

  def update
    result = OrderItems::Update.call(params: params, order_item: @order_item)
    if result.success?
      redirect_to cart_path, flash: { success: t('order_item.success_update') }
    else
      redirect_to cart_path, flash: { danger: t('order_item.error_update') }
    end
  end

  private

  def setup_order_item
    @order_item = OrderItem.find(params[:id])
  end

  def permitted_params
    params.require(:order_items).permit(:quantity, :book_id)
  end
end
