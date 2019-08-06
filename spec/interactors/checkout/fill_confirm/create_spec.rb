RSpec.describe Checkout::FillConfirm::Create do
  subject(:result) { described_class.call(order: order) }

  let(:order) { create(:order, :confirm_step, :with_order_item, id: 123, delivery: delivery) }
  let(:delivery) { create(:delivery) }

  describe 'call' do
    it 'expect to setup number to order' do
      expect(order.number).to eq(nil)
      expect(result).to be_success
      expect(order.number).to eq('R00000123')
    end

    it 'expect to update order' do
      expect(order.delivery_price).to eq(nil)
      result
      expect(order.delivery_price).to eq(delivery.price)
    end

    it 'expect to order items' do
      result
      order.order_items.each do |item|
        expect(item.price).to eq(item.book_price)
      end
    end
  end
end
