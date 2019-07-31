RSpec.describe Checkout::FillCompletesController, type: :controller do
  let!(:user) { create(:user) }

  before do
    allow(Orders::Check).to receive(:call).and_return(double(order: order))
    sign_in(user)
  end

  describe '#show' do
    context 'when order status successful' do
      let(:order) { create(:order, :with_order_item, :complete_step) }

      it do
        get :show
        expect(response).to be_successful
        expect(controller).to render_template(:show)
        expect(assigns(:order)).to be_kind_of(Order)
        expect(session[:order_id]).to be_nil
      end
    end

    context 'when order status failed' do
      let(:order) { create(:order, :with_order_item, :delivery_step) }

      it do
        get :show
        expect(response).not_to be_successful
        expect(controller).to redirect_to(checkout_fill_delivery_path)
      end
    end
  end
end
