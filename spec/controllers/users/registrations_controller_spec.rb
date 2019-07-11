RSpec.describe Users::RegistrationsController, type: :controller do
  let!(:user) { create(:user) }
  let!(:old_password) { user.encrypted_password }

  describe '#update' do
    before do
      request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in user
    end

    describe 'update password' do
      let(:params) do
        { user: { password: '123456', current_password: user.password,
                  password_confirmation: '123456' } }
      end

      it do
        patch :update, params: params
        expect(user.reload.encrypted_password).not_to eq(old_password)
      end
    end

    describe 'update email' do
      let!(:old_email) { user.email }
      let(:params) { { user: { email: 'lolkek@gmail.com' } } }

      it do
        patch :update, params: params
        expect(user.reload.email).not_to eq(old_email)
      end
    end
  end
end
