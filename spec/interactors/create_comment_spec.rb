RSpec.describe CreateComment do
  subject(:context) { described_class.call(params) }

  let!(:user) { create(:user) }
  let!(:book) { create(:book) }

  describe 'call' do
    context 'with valid params' do
      let(:params) { { mark: '4', title: 'asdasdas', description: 'asdasdasdasd', user_id: user.id, book_id: book.id } }

      it do
        expect(context.success?).to eq(true)
      end
    end

    context 'with valid params' do
      let(:params) { { mark: '4', title: '', description: '', user_id: user.id, book_id: book.id } }

      it do
        expect(context.success?).to eq(false)
      end
    end
  end
end
