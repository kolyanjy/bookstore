RSpec.describe Order, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user).optional }
    it { is_expected.to belong_to(:coupon).optional }
    it { is_expected.to have_many(:order_items).dependent(:destroy) }
    it { is_expected.to have_many(:addresses).dependent(:destroy) }
    it { is_expected.to have_one(:payment).dependent(:destroy) }
    it { is_expected.to have_one(:billing_address).dependent(:destroy) }
    it { is_expected.to have_one(:shipping_address).dependent(:destroy) }
  end

  describe 'after update' do
    before { create(:order_item, order: order, book: book) }

    let(:user) { create(:user) }
    let(:book) { create(:book) }

    context 'when status delivered' do
      let(:order) { create(:order, :delivered_step) }

      it do
        expect(Book.find_by(id: book.id).buy_count).to eq(0)
        order.update(user: user)
        expect(Book.find_by(id: book.id).buy_count).to eq(1)
      end
    end

    context 'when else status' do
      let(:order) { create(:order) }

      it do
        expect(Book.find_by(id: book.id).buy_count).to eq(0)
        order.update(user: user)
        expect(Book.find_by(id: book.id).buy_count).to eq(0)
      end
    end
  end
end
