RSpec.describe Checkout::FillCompletesController, type: :controller do
  let!(:user) { create(:user) }
  let!(:order) { create(:order, :with_order_item, :in_progress_step, :with_order_number, user: user) }

  before do
    sign_in(user)
  end

  describe '#show' do
    context 'when order number successful' do
      it do
        get :show, params: { number: order.number }
        expect(response).to be_successful
        expect(controller).to render_template(:show)
        expect(assigns(:order)).to be_kind_of(Order)
        expect(session[:order_id]).to be_nil
      end
    end

    context 'when order number failed' do
      it do
        get :show, params: { number: '1234' }
        expect(response).not_to be_successful
        expect(response.status).to eq(404)
      end
    end
  end
end
