RSpec.describe BooksPresenter do
  subject(:presenter) { described_class.new }

  let(:books_quantity) { 5 }

  describe 'check books count' do
    before { create_list(:book, books_quantity) }

    it { expect(presenter.books_count).to eq(books_quantity) }
  end

  describe 'check_filter' do
    context 'when filter nil' do
      let(:filter) { nil }

      it { expect(presenter.check_filter(filter)).to eq(Books::SortQuery::DEFAULT_FILTER) }
    end

    context 'when invalid filter' do
      let(:filter) { :lol }

      it { expect(presenter.check_filter(filter)).to eq(Books::SortQuery::DEFAULT_FILTER) }
    end

    context 'when valid filter' do
      let(:filter) { :title_asc }

      it { expect(presenter.check_filter(filter)).to eq(filter) }
    end
  end
end
