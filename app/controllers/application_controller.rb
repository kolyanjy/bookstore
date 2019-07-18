class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  helper_method :current_order, :loaded_categories

  private

  def current_order
    @current_order ||= Orders::Check.call(order_id: session[:order_id], user: current_user).order.decorate
  end

  def not_found
    render file: Rails.root.join('public', '404.html'), layout: false, status: 404
  end

  def loaded_categories
    @loaded_categories ||= Category.all
  end
end
