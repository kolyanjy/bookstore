class ConfirmationsController < Devise::ConfirmationsController
  private

  def after_confirmation_path_for(_resource_name, resource)
    sign_up(resource)
    your_new_after_confirmation_path
  end
end
