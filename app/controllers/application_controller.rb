class ApplicationController < ActionController::Base
  before_action :load_categories
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  def not_found
    render file: Rails.root.join('public', '404.html'), layout: false, status: 404
  end

  def load_categories
    @load_categories ||= Category.all
  end
end
