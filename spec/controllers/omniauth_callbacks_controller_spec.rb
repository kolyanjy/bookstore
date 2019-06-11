RSpec.describe Users::OmniauthCallbacksController do
  let(:auth_hash) do
    { 'provider' => 'facebook',
      'uid' => '2337086219864242',
      'info' => { 'email' => 'kolyan654d@gmail.com', 'first_name' => 'Kolyunya',
                  'last_name' => 'Kolesnikov', 'image' => 'http://graph.facebook.com/v2.10/2337086219864242/picture' } }
  end
  let(:call_interactor) { OmniauthFacebook.call(auth_hash: auth_hash) }
  let(:invalid_hash) { {} }

  context 'sign up or log in with facebook' do
    it 'user sign up' do
      expect{ call_interactor }.to change{User.count}.by(1)
    end

    it 'user log in' do
      call_interactor
      expect{ call_interactor }.to change{User.count}.by(0)
      expect(response).to have_http_status(200)
    end
  end
end
