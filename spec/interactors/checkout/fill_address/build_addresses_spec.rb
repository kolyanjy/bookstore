RSpec.describe Checkout::FillAddress::BuildAddresses do
  subject(:context) { described_class.call(order: order, user: user) }
  let!(:user) { create(:user) }

  describe 'call' do
    let(:order) { create(:order, user: user) }

    it do
      expect(context).to be_success
      expect(order.billing_address).to be_kind_of(BillingAddress)
      expect(order.shipping_address).to be_kind_of(ShippingAddress)
      expect(order.reload.billing_address).to eq(nil)
      expect(order.reload.shipping_address).to eq(nil)
    end
  end

end
