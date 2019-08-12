RSpec.describe Books::SortQuery do
  subject(:query_obj) { described_class.new }

  let!(:book_a) { create(:book, name: 'aaaa', price: 1, buy_count: 1) }
  let!(:book_b) { create(:book, name: 'bbbb', price: 2, buy_count: 2) }
  let!(:book_c) { create(:book, name: 'cccc', price: 3, buy_count: 3) }
  let!(:book_d) { create(:book, name: 'dddd', price: 4, buy_count: 4) }
  let(:books) { Book.all }

  describe 'title sort' do
    context 'when asc' do
      let(:filter) { 'title_asc' }

      it do
        expect(query_obj.call(books, filter)).to eq([book_a, book_b, book_c, book_d])
      end
    end

    context 'when desc' do
      let(:filter) { 'title_desc' }

      it do
        expect(query_obj.call(books, filter)).to eq([book_d, book_c, book_b, book_a])
      end
    end
  end

  describe 'price sort' do
    context 'when asc' do
      let(:filter) { 'price_asc' }

      it do
        expect(query_obj.call(books, filter)).to eq([book_a, book_b, book_c, book_d])
      end
    end

    context 'when desc' do
      let(:filter) { 'price_desc' }

      it do
        expect(query_obj.call(books, filter)).to eq([book_d, book_c, book_b, book_a])
      end
    end
  end

  describe 'created at sort' do
    context 'when desc' do
      let(:filter) { 'created_at' }

      it do
        expect(query_obj.call(books, filter)).to eq([book_d, book_c, book_b, book_a])
      end
    end
  end

  describe 'popular sort' do
    let(:filter) { 'popular' }

    it do
      expect(query_obj.call(books, filter)).to eq([book_d, book_c, book_b, book_a])
    end
  end

  describe 'sort without filter' do
    it do
      expect(query_obj.call(books, nil)).to eq([book_a, book_b, book_c, book_d])
    end
  end
end
