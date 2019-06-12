class Users::CreateFromOmniauth
  include Interactor

  def call
    context.user = find_or_create_user
    context.fail! unless context.user.persisted?
  end

  def find_or_create_user
    auth = context.auth_hash
    info = auth['info']
    User.where(provider: auth['provider'], uid: auth['uid']).first_or_create do |user|
      user.email = info['email']
      user.first_name = info['first_name']
      user.last_name = info['last_name']
      user.image = info['image']
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
