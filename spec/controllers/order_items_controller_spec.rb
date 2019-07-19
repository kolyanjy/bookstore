RSpec.describe OrderItemsController, type: :controller do
  let(:order) { create(:order) }
  let(:book) { create(:book) }
  let(:default_count) { 1 }

  describe '#create' do
    context 'when success add order_item' do
      it do
        expect(OrderItem.count).to eq(0)
        post :create, params: { book_id: book.id, order_items: { book_id: book.id, quantity: default_count } }
        expect(OrderItem.count).to eq(default_count)
        expect(controller).to set_flash[:notice].to I18n.t('order_item.success_update')
        expect(response.status).to eq(302)
      end
    end

    context 'when failed add order_item' do
      it do
        expect(OrderItem.count).to eq(0)
        post :create, params: { book_id: book.id, order_items:
           { book_id: book.id, quantity: nil } }
        expect(OrderItem.count).to eq(0)
        expect(response.status).to eq(302)
      end
    end
  end

  describe '#destroy' do
    let!(:order_item) { create(:order_item) }

    context 'when order item exist' do
      it do
        expect(OrderItem.count).to eq(default_count)
        post :destroy, params: { id: order_item.id }
        expect(OrderItem.count).to eq(0)
        expect(controller).to set_flash[:success].to I18n.t('order_item.success_delete')
        expect(response.status).to eq(302)
      end
    end

    context 'when order item not found' do
      it do
        expect(OrderItem.count).to eq(default_count)
        post :destroy, params: { id: 100 }
        expect(OrderItem.count).to eq(default_count)
        expect(response.status).to eq(404)
      end
    end
  end

  describe '#update' do
    let(:order_item) { create(:order_item) }

    context 'when valid change quantity' do
      let(:changed_count) { 2 }

      it do
        post :update, params: { id: order_item.id, quantity: changed_count }
        expect(OrderItem.find(order_item.id).quantity).to eq(changed_count)
        expect(controller).to set_flash[:success].to I18n.t('order_item.success_update')
        expect(response.status).to eq(302)
      end
    end

    context 'when invalid change quantity' do
      let(:changed_count) { 0 }

      it do
        expect(OrderItem.find(order_item.id).quantity).to eq(default_count)
        post :update, params: { id: order_item.id, quantity: changed_count }
        expect(OrderItem.find(order_item.id).quantity).to eq(default_count)
        expect(controller).to set_flash[:danger].to I18n.t('order_item.error_update')
        expect(response.status).to eq(302)
      end
    end
  end
end
