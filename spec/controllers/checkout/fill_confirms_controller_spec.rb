RSpec.describe Checkout::FillConfirmsController, type: :controller do
  let!(:user) { create(:user) }
  let!(:delivery) { create(:delivery) }

  before do
    allow(Orders::Check).to receive(:call).and_return(double(order: order))
    sign_in(user)
  end

  describe '#show' do
    context 'when order status successful' do
      let(:order) { create(:order, :with_order_item, :confirm_step, delivery: delivery) }

      it do
        get :show
        expect(response).to be_successful
        expect(controller).to render_template(:show)
      end
    end

    context 'when order status failed' do
      let(:order) { create(:order, :with_order_item, :payment_step, delivery: delivery) }

      it do
        get :show
        expect(response).not_to be_successful
        expect(controller).to redirect_to(checkout_fill_payment_path)
      end
    end
  end

  describe '#create' do
    let(:delivery) { create(:delivery) }

    context 'when valid' do
      let(:order) { create(:order, :with_order_item, :confirm_step, delivery: delivery) }

      it do
        post :create
        expect(response).not_to be_successful
        expect(order.number).not_to be_nil
        expect(controller).to redirect_to(checkout_fill_complete_path(order.number))
      end
    end

    context 'when invalid' do
      let(:order) { create(:order, :with_order_item, :payment_step, delivery: delivery) }

      it do
        post :create
        expect(response).not_to be_successful
        expect(controller).to redirect_to(checkout_fill_payment_path)
      end
    end
  end
end
