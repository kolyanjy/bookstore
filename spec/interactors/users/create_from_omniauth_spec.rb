RSpec.describe Users::CreateFromOmniauth do
  subject(:interactor) { described_class.new.context }

  describe 'when use omniauth with valid data' do
    subject(:interactor_valid_call) { described_class.call(auth_hash: OmniAuth.config.mock_auth[:facebook]) }

    context 'when user try to sign up' do
      it 'user sign up' do
        expect { interactor_valid_call }.to change(User, :count).by(1)
        expect(interactor.success?).to eq(true)
      end
    end

    context 'when user try to log in' do
      before { create(:user, :with_facebook) }

      it 'user log in' do
        expect { interactor_valid_call }.to change(User, :count).by(0)
        expect(interactor.success?).to eq(true)
      end
    end
  end

  context 'when user try to use omniauth with invalid data' do
    subject(:interactor_invalid_call) { described_class.call(auth_hash: OmniAuth.config.mock_auth[:facebook_invalid]) }

    it 'sign up' do
      expect { interactor_invalid_call }.to change(User, :count).by(0)
      expect(interactor_invalid_call.success?).to eq(false)
    end
  end
end
