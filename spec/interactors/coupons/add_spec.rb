RSpec.describe Coupons::Add do
  subject(:result) { described_class.call(order: order, key: key) }

  let!(:order) { create(:order) }

  context 'when success' do
    let!(:coupon) { create(:coupon) }
    let(:key) { coupon.key }

    it do
      expect(result).to be_success
      expect(order.coupon).to eq(coupon)
    end
  end

  context 'when success' do
    let(:key) { '123' }

    it do
      expect(result).not_to be_success
      expect(order.coupon).to eq(nil)
    end
  end
end
