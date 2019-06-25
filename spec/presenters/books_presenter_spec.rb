RSpec.describe BooksPresenter do
  subject(:presenter) { described_class.new }

  BOOKS_QUANTITY = 5

  describe 'check books count by category' do
    let(:category) { create(:category, :with_book) }

    it { expect(presenter.category_books_count(category.id)).to eq(1) }
  end

  describe 'check books count' do
    before { create_list(:book, BOOKS_QUANTITY) }

    it { expect(presenter.books_count).to eq(BOOKS_QUANTITY) }
  end
end
