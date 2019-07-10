RSpec.describe Users::RegistrationsController, type: :controller do
  let!(:user) { create(:user) }
  let!(:old_password) { user.encrypted_password }

  # describe '#update' do
  #   before { sign_in user }
  # 
  #   describe 'update password' do
  #     let(:params) { { user: { password: '123456', current_password: user.password, password_confirmation: '123456' } } }
  # 
  #     it do
  #       patch :update, params: params
  #       expect(user.encrypted_password).not_to eq(old_password)
  #     end
  #   end
  # 
  #   describe 'update email' do
  #     let!(:old_email) { user.email }
  #     let(:params) { { user: { email: 'lolkek@gmail.com' } } }
  # 
  #     it do
  #       patch :update, params: params
  #       expect(user.email).not_to eq(old_email)
  #     end
  #   end
  # end
end
