RSpec.describe Books::CategoryQuery do
  subject(:query_obj) { described_class.new }

  let(:book_quantity) { 5 }

  describe 'call query obj' do
    context 'without category' do
      before { create_list(:book, book_quantity) }

      it { expect(query_obj.call.count).to eq(book_quantity) }
    end

    context 'with category' do
      let(:category) { create(:category, :with_books, amount: book_quantity) }

      before { create(:book) }

      it { expect(query_obj.call(category.id).map(&:category_id)).to eq([category.id] * book_quantity) }
    end
  end
end
