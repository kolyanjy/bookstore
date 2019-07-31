RSpec.describe Checkout::FillAddressesController, type: :controller do
  let!(:user) { create(:user) }
  before do
    allow(Orders::Check).to receive(:call).and_return(double(order: order))
    sign_in(user)
  end

  describe '#show' do
    context 'when order status successful' do
      let(:order) { create(:order, :with_order_item, :address_step) }

      it do
        get :show
        expect(response).to be_successful
        expect(controller).to render_template(:show)
        expect(order.billing_address).to be_kind_of(BillingAddress)
        expect(order.shipping_address).to be_kind_of(ShippingAddress)
      end
    end

    context 'when order status failed' do
      let(:order) { create(:order, :with_order_item) }

      it do
        get :show
        expect(response).not_to be_successful
        expect(controller).to redirect_to(cart_path)
      end
    end
  end

  describe '#create' do
    context 'when valid' do
      let(:order) { create(:order, :with_order_item, :address_step) }
      let(:params) { { order: { billing_address_attributes: attributes_for(:address),
         shipping_address_attributes: attributes_for(:address) }, hidden_shipping_form: { show: '1' } } }

      it do
        post :create, params: params
        expect(response).not_to be_successful
        expect(controller).to redirect_to(checkout_fill_delivery_path)
      end
    end

    context 'when invalid' do
      let(:order) { create(:order, :with_order_item, :address_step) }
      let(:params) { { order: { billing_address_attributes: attributes_for(:address, first_name: nil),
         shipping_address_attributes: attributes_for(:address) }, hidden_shipping_form: { show: '1' } } }

      it  do
        post :create, params: params
        expect(response).not_to be_successful
        expect(controller).to redirect_to(checkout_fill_address_path)
      end
    end
  end
end
