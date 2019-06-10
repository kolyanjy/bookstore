class OmniauthFacebook
  include Interactor

  def call
    context.user = find_or_create_user
    context.fail! unless context.user.persisted?
  end

  def find_or_create_user
    auth = context.auth_hash
    User.where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.image = auth.info.image
      user.password = Devise.friendly_token[0, 20]
    end
  end

end
