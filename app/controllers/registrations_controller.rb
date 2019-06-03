class RegistrationsController < Devise::RegistrationsController
  def update_resource(resource, registrations_params)
    registrations_params[:current_password] ? super : resource.update_without_password(registrations_params)
  end

  def after_inactive_sign_up_path_for(_resource)
    session[:order_id] ? order_order_step_path(id: Order::STEPS.first, order_id: session[:order_id]) : root_path
  end

  private

  def registrations_params
    params.require(:user).permit(:email, :current_password)
  end
end
