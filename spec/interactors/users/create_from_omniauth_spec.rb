RSpec.describe Users::CreateFromOmniauth do
  subject(:result) { described_class.call(auth_hash: auth_hash) }

  let(:auth_hash) { OmniAuth.config.mock_auth[:facebook] }

  describe 'when use omniauth with valid data' do
    context 'when user try to sign up' do
      it 'user sign up' do
        expect { result }.to change(User, :count).by(1)
        expect(result).to be_success
      end
    end

    context 'when user try to log in' do
      before { create(:user, :with_facebook) }

      it 'user log in' do
        expect { result }.to change(User, :count).by(0)
        expect(result).to be_success
      end
    end
  end

  context 'when user try to use omniauth with invalid data' do
    let(:auth_hash) { OmniAuth.config.mock_auth[:facebook_invalid] }

    it 'sign up' do
      expect { result }.to change(User, :count).by(0)
      expect(result).to be_failure
    end
  end
end
