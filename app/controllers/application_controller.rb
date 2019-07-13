class ApplicationController < ActionController::Base
  before_action :loaded_categories
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  def current_order
    @current_order ||= Orders::CheckService.new(session[:order_id], current_user).call
  end

  def not_found
    render file: Rails.root.join('public', '404.html'), layout: false, status: 404
  end

  def loaded_categories
    @loaded_categories ||= Category.all
  end
end
