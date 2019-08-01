RSpec.describe Coupons::Add do
  subject(:context) { described_class.call(order: order, key: key) }

  let!(:order) { create(:order) }

  context 'when success' do
    let!(:coupon) { create(:coupon) }
    let(:key) { coupon.key }

    it do
      expect(context).to be_success
      expect(order.coupon).to be_kind_of(Coupon)
    end
  end

  context 'when success' do
    let(:key) { '123' }

    it do
      expect(context).not_to be_success
      expect(order.coupon).to eq(nil)
    end
  end
end
