module Users
  class RegistrationsController < Devise::RegistrationsController
    def new
      super do
        if params[:quick]
          return redirect_to(books_path), flash: { danger: t('order.add_to_cart') } if current_order.order_items.empty?

          render('quick_new') && return
        end
      end
    end

    def create
      ActiveRecord::Base.transaction do
        super do |user|
          BillingAddress.new(addressable: user).save(validate: false)
          ShippingAddress.new(addressable: user).save(validate: false)
          quick_registration && return if params[:user][:quick]
        end
      end
    end

    private

    def quick_registration # rubocop:disable Metrics/AbcSize
      resource.skip_confirmation!
      resource.password = Devise.friendly_token.first(Devise.password_length.begin)
      resource.orders << current_order
      sign_up(resource_name, resource) if resource.save

      redirect_to(cart_path)
    end

    def update_resource(user, params)
      params[:password].present? ? password_update(user, params) : email_update(user, params)
    end

    def after_update_path_for(_resource)
      edit_user_registration_path
    end

    def password_update(user, params)
      return true if user.update_with_password(params)

      flash[:danger] = I18n.t('settings.danger_update_password')
      false
    end

    def email_update(user, params)
      return true if user.update_without_password(params)

      flash[:danger] = I18n.t('settings.danger_update_email')
      false
    end
  end
end
