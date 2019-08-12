RSpec.describe BookImage, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:book) }
  end
end
