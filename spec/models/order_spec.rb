RSpec.describe Order, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user).without_validating_presence }
    it { is_expected.to belong_to(:coupon).without_validating_presence }
    it { is_expected.to have_many(:order_items).dependent(:destroy) }
    it { is_expected.to have_many(:addresses).dependent(:destroy) }
    it { is_expected.to have_one(:payment).dependent(:destroy) }
    it { is_expected.to have_one(:billing_address).dependent(:destroy) }
    it { is_expected.to have_one(:shipping_address).dependent(:destroy) }
  end
end
