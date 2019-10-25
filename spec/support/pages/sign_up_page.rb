class SignUpPage < SitePrism::Page
  element :user_email_field, "input[id='user_email']"
  element :user_password_field, "input[id='user_password']"
  element :user_password_confirmation_field, "input[id='user_password_confirmation']"
  set_url '/users/sign_up'
  def sign_up(useremail, password, confirm_password = password)
    user_email_field.set(useremail)
    user_password_field.set(password)
    user_password_confirmation_field.set(confirm_password)
    click_on(I18n.t('user.registration.sign_up'))
  end
end