RSpec.describe BooksCategoryQuery do
  subject(:query_obj) { described_class.new }

  describe 'call query obj' do
    context 'without category' do
      before { create_list(:book, BOOKS_QUANTITY) }

      it { expect(query_obj.call.count).to eq(BOOKS_QUANTITY) }
    end

    context 'with category' do
      let(:category) { create(:category, :with_books) }

      it { expect(Book.where(category_id: category.id).count).to eq(BOOKS_QUANTITY) }
    end
  end
end
