module Users
  class AddressesController < ApplicationController
    before_action :authenticate_user!

    def update
      if current_user.update(address_params)
        flash[:success] = I18n.t('settings.address.success_update')
      else
        flash[:danger] = I18n.t('settings.address.danger_update')
      end
      redirect_to edit_user_registration_path
    end

    private

    def address_params
      params.require(:user).permit(
        shipping_address_attributes: Address::ADDRESS_PARAMS,
        billing_address_attributes: Address::ADDRESS_PARAMS
      )
    end
  end
end
