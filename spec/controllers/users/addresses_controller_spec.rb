RSpec.describe Users::AddressesController, type: :controller do
  let!(:user) { create(:user) }

  describe '#update' do
    before { sign_in user }

    context 'when valid' do
      let(:params) { { user: { billing_address_attributes: attributes_for(:address) } } }
      it 'valid' do # rubocop:disable  RSpec/ExampleLength
        patch :update, params: params
        expect(response.status).to eq(302)
        expect(controller).to set_flash[:success].to I18n.t('settings.address.success_update')
        expect(controller).to redirect_to(edit_user_registration_path)
      end
    end

    context 'when invalid' do
      let(:params) { { user: { billing_address_attributes: { attributes_for(:address, first_name: nil)  } } } }
      it 'valid' do # rubocop:disable  RSpec/ExampleLength
        patch :update, params: params
        expect(response.status).to eq(302)
        expect(controller).to set_flash[:danger].to I18n.t('settings.address.danger_update')
        expect(controller).to redirect_to(edit_user_registration_path)
      end
    end
  end
end
