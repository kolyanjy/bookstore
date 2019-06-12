RSpec.describe Users::CreateFromOmniauth do
  let(:interactor) { described_class.new.context }
  let(:interactor_valid_call) { described_class.call(auth_hash: OmniAuth.config.mock_auth[:facebook]) }
  let(:interactor_invalid_call) { described_class.call(auth_hash: OmniAuth.config.mock_auth[:facebook_invalid]) }

  context 'when user try to sign up with facebook' do
    it 'user sign up' do
      expect { interactor_valid_call }.to change(User, :count).by(1)
      expect(interactor.success?).to eq(true)
    end

    it 'when user try to sign up with invalid data' do
      expect { interactor_invalid_call }.to change(User, :count).by(0)
      expect(interactor_invalid_call.success?).to eq(false)
    end

    it 'when user try to login' do
      create(:user, :with_facebook)
      expect { interactor_valid_call }.to change(User, :count).by(0)
      expect(interactor.success?).to eq(true)
    end
  end
end
