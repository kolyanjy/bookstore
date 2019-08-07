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

  describe '#add_couopon' do
    context 'when coupon exist' do
      let!(:coupon) { create(:coupon) }
      let(:params) { { coupon: { key: coupon.key }, id: order.id } }

      it do
        put :add_couopon, params: params
        expect(controller).to set_flash[:success].to I18n.t('coupon.success_update')
        expect(controller).to redirect_to(cart_path)
      end
    end

    context 'when coupon not exist' do
      let(:params) { { coupon: { key: '1' }, id: order.id } }

      it do
        put :add_couopon, params: params
        expect(controller).to set_flash[:danger].to I18n.t('coupon.not_found')
        expect(controller).to redirect_to(cart_path)
      end
    end
  end
end
