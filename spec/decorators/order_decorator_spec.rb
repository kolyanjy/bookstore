RSpec.describe OrderDecorator do
  subject(:decorator) { described_class.new(order) }

  let!(:order) { create(:order) }

  describe 'items_sum' do
    let(:item_quantity) { 2 }

    before { item_quantity.times { create(:order_item, order: order) } }

    it { expect(decorator.items_sum).to eq(item_quantity) }
  end
end
