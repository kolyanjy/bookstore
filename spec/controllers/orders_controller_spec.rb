RSpec.describe OrdersController, type: :controller do
  let!(:user) { create(:user) }
  let!(:order) { create(:order, :with_order_number, user: user) }

  before do
    sign_in user
  end

  describe 'index' do
    it do
      get :index
      expect(assigns(:orders)).to be_kind_of(Draper::CollectionDecorator)
      expect(response).to be_successful
    end
  end

  describe '#show' do
    context 'when valid show' do
      it do
        get :show, params: { id: order.id }
        expect(assigns(:order)).to be_kind_of(Order)
        expect(response).to be_successful
      end
    end

    context 'when invalid show' do
      let(:invalid_id) { '1488' }

      it do
        get :show, params: { id: invalid_id }
        expect(response.status).to eq 404
      end
    end
  end
end
