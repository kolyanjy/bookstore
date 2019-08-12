RSpec.describe OrderItem, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:book) }
    it { is_expected.to belong_to(:order) }
  end

  describe 'validation' do
    it { is_expected.to validate_numericality_of(:quantity).is_greater_than(0) }
    it { is_expected.to validate_presence_of(:quantity) }
  end
end
