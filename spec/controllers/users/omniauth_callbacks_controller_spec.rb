RSpec.describe Users::OmniauthCallbacksController do # rubocop:disable Metrics/BlockLength:
  subject(:callback) { described_class.new }

  let(:auth_hash) { OmniAuth.config.mock_auth[:facebook] }

  before do
    request.env['devise.mapping'] = Devise.mappings[:user]
    request.env['omniauth.auth'] = auth_hash
  end

  context 'when call omniauth callback with success result' do
    let(:user) { build(:user) }
    let(:result) { double(:result, success?: true, user: user) }

    it 'redirects to root' do
      expect(Users::CreateFromOmniauth).to receive(:call).with(auth_hash: auth_hash).and_return(result)
      get 'facebook'
      expect(flash[:alert]).to be_present
      expect(callback).to redirect_to(new_user_session_path)
    end
  end

  context 'when call omniauth callback with fail result' do
    let(:user) { build(:user) }
    let(:result) { double(:result, success?: false, user: user) }

    it 'redirects to root' do
      allow(Users::CreateFromOmniauth).to receive(:call).with(auth_hash: auth_hash).and_return(result)
      get 'facebook'
      expect(callback).to redirect_to(new_user_registration_url)
      expect(session['devise.facebook_data']).to eq(auth_hash)
    end
  end
end
