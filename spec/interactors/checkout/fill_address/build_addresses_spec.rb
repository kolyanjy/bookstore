RSpec.describe Checkout::FillAddress::BuildAddresses do
  subject(:result) { described_class.call(order: order, user: user) }

  let!(:user) { create(:user) }

  describe 'call' do
    let(:order) { create(:order, user: user) }

    it 'check order not saved in the database' do
      expect(result).to be_success
      expect(order.reload.billing_address).to eq(nil)
      expect(order.reload.shipping_address).to eq(nil)
    end

    it 'check build addresses attributes for order' do
      result
      expect(order.billing_address.slice(*Address::ADDRESS_PARAMS).symbolize_keys)
        .to eq(user.billing_address.slice(*Address::ADDRESS_PARAMS).symbolize_keys)

      expect(order.shipping_address.slice(*Address::ADDRESS_PARAMS).symbolize_keys)
        .to eq(user.shipping_address.slice(*Address::ADDRESS_PARAMS).symbolize_keys)
    end
  end
end
