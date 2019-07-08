RSpec.describe AddressesPresenter do
  subject(:presenter) { described_class.new(user) }

  let!(:user) { create(:user) }

  describe 'presenter' do
    it 'check shipping address' do
      expect(presenter.shipping_address).to be_kind_of(ShippingAddress)
    end

    it 'check billing address' do
      expect(presenter.billing_address).to be_kind_of(BillingAddress)
    end
  end
end
