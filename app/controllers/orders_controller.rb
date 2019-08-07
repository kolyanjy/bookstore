class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = Orders::StatusQuery.new(current_user, params[:sort]).call.decorate
    @presenter = OrdersPresenter.new
  end

  def show
    @order = current_user.orders.find_by!(id: params[:id]).decorate
  end
end
