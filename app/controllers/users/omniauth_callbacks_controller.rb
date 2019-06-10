class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    auth_hash = request.env['omniauth.auth']
    result = OmniauthFacebook.call(auth_hash: auth_hash)
    if result.success?
      sign_in_and_redirect result.user, event: :authentication
      set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
    else
      session['devise.facebook_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end
