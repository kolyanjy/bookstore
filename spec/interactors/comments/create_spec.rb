RSpec.describe Comments::Create do
  subject(:result) { described_class.call(params: comment, user: user, book_id: book.id) }

  let!(:user) { create(:user) }
  let!(:book) { create(:book) }

  describe 'call' do
    context 'with valid params' do
      let(:comment) { attributes_for(:comment) }

      it do
        expect(result).to be_success
        expect(Comment.count).to eq(1)
      end
    end

    context 'with valid params and verified comment' do
      let!(:order) { create(:order, :delivered_step, user: user) }
      let(:comment) { attributes_for(:comment) }

      before do
        create(:order_item, book_id: book.id, order_id: order.id)
      end

      it do
        expect(result).to be_success
        expect(Comment.count).to eq(1)
        expect(Comment.last).to be_verified
      end
    end

    context 'with invalid params' do
      let(:comment) { attributes_for(:comment, title: '') }

      it do
        expect(result).to be_failure
        expect(Comment.count).to eq(0)
      end
    end
  end
end
