RSpec.describe Users::OmniauthCallbacksController do
  let(:auth_hash) { OmniAuth.config.mock_auth[:facebook] }

  before do
    request.env['devise.mapping'] = Devise.mappings[:user]

    request.env['omniauth.auth'] = auth_hash
  end

  context 'call omniauth callback with success result' do
    let(:user) { build(:user) }
    let(:result) { double(:result, success?: true, user: user) }

    it 'redirects to root' do
      expect(Users::CreateFromOmniauth).to receive(:call).with(auth_hash: auth_hash).and_return(result)

      get 'facebook'
    end
  end

  context 'call omniauth callback with fail result' do
    let(:user) { build(:user) }
    let(:result) { double(:result, success?: false, user: user) }
    before do
    end
    it 'redirects to root' do
      expect(Users::CreateFromOmniauth).to receive(:call).with(auth_hash: auth_hash).and_return(result)
      get 'facebook'
      expect(subject).to redirect_to(new_user_registration_url)
      expect(session['devise.facebook_data']).to eq(request.env['omniauth.auth'])
    end
  end

end
