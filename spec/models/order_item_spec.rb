RSpec.describe OrderItem, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:book) }
    it { is_expected.to belong_to(:order) }
  end

  describe 'validation' do
    it { is_expected.not_to allow_value('').for(:quantity) }
    it { is_expected.to validate_presence_of(:quantity) }
  end
end
