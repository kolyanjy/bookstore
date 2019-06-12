RSpec.configure do |_config|
  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
    provider: 'facebook',
    uid: '2337086219864242',
    info: { email: 'kolyan654d@gmail.com', first_name: 'Kolyunya',
            last_name: 'Kolesnikov', image: 'http://graph.facebook.com/v2.10/2337086219864242/picture' }
  )
end
