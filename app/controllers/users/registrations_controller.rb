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
      updated = params[:password].present? ? password_update(user, params) : email_update(user, params)
    end

    def after_update_path_for(resource)
      sign_in_after_change_password? ? edit_user_registration_path : new_session_path(resource_name)
    end

    private

    def password_update(user, params)
      if user.update_with_password(params)
        bypass_sign_in resource
      else
        flash[:danger] = I18n.t('settings.danger_update_password')
        false
      end
    end

    def email_update(user, params)
      if user.update_without_password(params)
        bypass_sign_in resource
      else
        flash[:danger] = I18n.t('settings.danger_update_email')
        false
      end
    end
  end
end
