module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action only: :create

    def create
      ActiveRecord::Base.transaction do
        super do |user|
          BillingAddress.new(addressable: user).save(validate: false)
          ShippingAddress.new(addressable: user).save(validate: false)
        end
      end
    end

    def update_resource(user, params)
      params[:password].present? ? password_update(user, params) : email_update(user, params)
    end

    def after_update_path_for(_resource)
      edit_user_registration_path
    end

    private

    def password_update(user, params)
      if user.update_with_password(params)
        true
      else
        flash[:danger] = I18n.t('settings.danger_update_password')
        false
      end
    end

    def email_update(user, params)
      if user.update_without_password(params)
        true
      else
        flash[:danger] = I18n.t('settings.danger_update_email')
        false
      end
    end
  end
end
