RSpec.describe Checkout::FillConfirm::Organizer do
  subject(:interactor) { described_class.new }

  describe 'organizer' do
    it { expect(interactor).to be_kind_of(Interactor::Organizer) }
    it { expect(described_class.organized).to eq([Checkout::CheckPermission, Checkout::FillConfirm::Create]) }
  end
end
