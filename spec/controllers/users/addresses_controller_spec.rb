RSpec.describe Users::AddressesController, type: :controller do
  let!(:user) { create(:user) }

  describe '#update' do
    before { sign_in user }

    context 'when valid' do
      it 'valid' do # rubocop:disable  RSpec/ExampleLength
        patch :update, params: {
          user: { "billing_address_attributes": {
            first_name: 'valid_input', last_name: 'valid_input', address: 'valid_input', city: 'valid_input', zip: 123,
            country: 'valid_input', phone: '1231928379'
          } }
        }
        expect(response.status).to eq 302
        expect(subject).to set_flash[:success] # rubocop:disable RSpec/NamedSubject
          .to I18n.t('settings.address.success_update')
        expect(subject).to redirect_to(edit_user_registration_path) # rubocop:disable RSpec/NamedSubject
      end
    end

    context 'when invalid' do
      it 'valid' do # rubocop:disable  RSpec/ExampleLength
        patch :update, params: {
          user: { "billing_address_attributes": {
            first_name: '', last_name: '', address: '', city: '', zip: 123,
            country: '', phone: '1231928379'
          } }
        }
        expect(response.status).to eq 302
        expect(subject).to set_flash[:danger] # rubocop:disable RSpec/NamedSubject
          .to I18n.t('settings.address.danger_update')
        expect(subject).to redirect_to(edit_user_registration_path) # rubocop:disable RSpec/NamedSubject
      end
    end
  end
end
