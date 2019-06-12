RSpec.describe Users::CreateFromOmniauth do
  let(:interactor_call) { described_class.call(auth_hash: OmniAuth.config.mock_auth[:facebook]) }

  context 'when user try to sign up or log in with facebook' do
    it 'user sign up' do
      expect { interactor_call }.to change(User, :count).by(1)
      expect(subject.context).to be_a_success
    end

    it 'user log in' do
      interactor_call
      expect { interactor_call }.to change(User, :count).by(0)
      expect(subject.context).to be_a_success
    end
  end
end
