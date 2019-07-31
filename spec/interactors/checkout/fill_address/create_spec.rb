RSpec.describe Checkout::FillAddress::Create do
  # before { allow(subject).to receive(:current_order).and_return(order) }
  subject(:context) { described_class.call(params: params, order: order, hidden_shipping_form: hidden_shipping_form) }
  let(:billing_address) { attributes_for(:billing_address) }
  let(:shipping_address) { attributes_for(:shipping_address) }
  let(:order) { create(:order, :address_step) }

  describe 'call' do

    context 'with valid params' do
      let(:hidden_shipping_form) { {show: '0'} }
      let(:params) { {shipping_address_attributes: shipping_address,
        billing_address_attributes: billing_address } }

      it do
        expect(context.success?).to eq(true)
        expect(order.billing_address.slice(*Users::AddressesController::ADDRESS_PARAMS).symbolize_keys).
        to eq(billing_address)
        expect(order.shipping_address.slice(*Users::AddressesController::ADDRESS_PARAMS).symbolize_keys).
        to eq(shipping_address)
      end
    end

    context 'when shipping form is hidden' do
      let(:hidden_shipping_form) { {show: '1'} }
      let(:params) { {shipping_address_attributes: shipping_address,
        billing_address_attributes: billing_address } }

      it do
        expect(context.success?).to eq(true)
        expect(order.billing_address.slice(*Users::AddressesController::ADDRESS_PARAMS).symbolize_keys).
        to eq(billing_address)
        expect(order.shipping_address.slice(*Users::AddressesController::ADDRESS_PARAMS).symbolize_keys).
        to eq(billing_address)
      end
    end
    context 'with invalid params' do
      let(:hidden_shipping_form) { {show: '0'} }
      let(:params) do
        { shipping_address_attributes: { first_name: 'lol'},  billing_address_attributes: { first_name: 'kek'} }
      end

      it do
        expect(context).to be_failure
        expect(order).to be_invalid
      end
    end
  end
end
