RSpec.describe Home::HomeOrganizer do
  subject(:interactor) { described_class.new }
  describe 'organizer' do
    it { expect(interactor).to be_kind_of(Interactor::Organizer) }
    it { expect(described_class.organized).to eq([Home::TakeBestSellers, Home::TakeSliderBooks]) }
  end
end
