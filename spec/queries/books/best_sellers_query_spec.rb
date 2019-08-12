RSpec.describe Books::BestSellersQuery do
  subject(:query_obj) { described_class.new }

  let(:limit) { 4 }
  let!(:book_1) { create(:book, buy_count: 1) } # rubocop:disable RSpec/LetSetup
  let!(:book_2) { create(:book, buy_count: 2) }
  let!(:book_3) { create(:book, buy_count: 3) }
  let!(:book_4) { create(:book, buy_count: 4) }
  let!(:book_5) { create(:book, buy_count: 2) }

  describe 'call' do
    it 'sort book' do
      expect(query_obj.call(limit)).to eq([book_4, book_3, book_2, book_5])
    end
  end
end
