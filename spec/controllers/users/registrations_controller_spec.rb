RSpec.describe Users::RegistrationsController, type: :controller do
  subject(:controller) { described_class.new }

  let!(:user) { create(:user) }
  let!(:old_password) { user.encrypted_password }

  describe '#update' do
    describe 'update password' do
      let(:params) { { password: '123456', current_password: user.password, password_confirmation: '123456' } }

      it do
        controller.update_resource(user, params)
        expect(user.encrypted_password).not_to eq(old_password)
      end
    end

    describe 'update email' do
      let!(:old_email) { user.email }
      let(:params) { { email: 'lolkek@gmail.com' } }

      it do
        controller.update_resource(user, params)
        expect(user.email).not_to eq(old_email)
      end
    end
  end
end
