RSpec.describe CouponsController, type: :controller do
  describe '#update' do
    context 'when coupon exist' do
      let!(:coupon) { create(:coupon) }
      let(:params) { {coupon: {key: coupon.key } } }

      it do
        put :update, params: params
        expect(controller).to set_flash[:success].to I18n.t('coupon.success_update')
        expect(controller).to redirect_to(cart_path)
      end
    end

    context 'when coupon not exist' do
      let(:params) { {coupon: {key: '1' } } }

      it do
        put :update, params: params
        expect(controller).to set_flash[:danger].to I18n.t('coupon.not_found')
        expect(controller).to redirect_to(cart_path)
      end
    end
  end
end
