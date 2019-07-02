RSpec.describe BooksPresenter do
  subject(:presenter) { described_class.new }

  BOOKS_QUANTITY = 5

  describe 'check books count' do
    before { create_list(:book, BOOKS_QUANTITY) }

    it { expect(presenter.books_count).to eq(BOOKS_QUANTITY) }
  end
end
