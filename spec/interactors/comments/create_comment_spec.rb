RSpec.describe Comments::CreateComment do
  subject(:context) { described_class.call(params: comment, current_user: user, book_id: book.id) }

  let!(:user) { create(:user) }
  let!(:book) { create(:book) }

  describe 'call' do
    context 'with valid params' do
      let(:comment) { attributes_for(:comment) }

      it do
        expect(context.success?).to eq(true)
      end
    end

    context 'with invalid params' do
      let(:comment) { attributes_for(:comment, title: '') }

      it do
        expect(context.success?).to eq(false)
      end
    end
  end
end
