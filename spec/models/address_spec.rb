RSpec.describe Address, type: :model do
  context 'with assosiations' do
    it { is_expected.to belong_to(:addressable) }
  end
end
