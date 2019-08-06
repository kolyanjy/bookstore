RSpec.describe Checkout::FillDeliveriesController, type: :controller do
  let!(:user) { create(:user) }

  before do
    allow(Orders::Check).to receive(:call).and_return(double(order: order))
    sign_in(user)
  end

  describe '#show' do
    context 'when order status successful' do
      let(:order) { create(:order, :with_order_item, :delivery_step) }
      let!(:delivery_1) { create(:delivery, price: 10) }
      let!(:delivery_2) { create(:delivery, price: 20) }

      it do
        get :show
        expect(response).to be_successful
        expect(controller).to render_template(:show)
        expect(assigns(:deliveries).first).to eq(delivery_1)
        expect(assigns(:deliveries).last).to eq(delivery_2)
      end
    end

    context 'when order status failed' do
      let(:order) { create(:order, :with_order_item, :address_step) }

      it do
        get :show
        expect(response).not_to be_successful
        expect(controller).to redirect_to(checkout_fill_address_path)
      end
    end
  end

  describe '#create' do
    context 'when valid' do
      let!(:delivery) { create(:delivery) }
      let(:order) { create(:order, :with_order_item, :delivery_step) }
      let(:params) { { order: { delivery_id: delivery.id } } }

      it do
        post :create, params: params
        expect(response).not_to be_successful
        expect(controller).to redirect_to(checkout_fill_payment_path)
      end
    end

    context 'when invalid' do
      let(:order) { create(:order, :with_order_item, :address_step) }
      let(:params) { { order: { delivery_id: '1' } } }

      it do
        post :create, params: params
        expect(response).not_to be_successful
        expect(controller).to redirect_to(checkout_fill_address_path)
      end
    end
  end
end
