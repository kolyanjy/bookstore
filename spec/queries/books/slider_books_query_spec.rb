RSpec.describe Books::SliderBooksQuery do
  subject(:query_obj) { described_class.new }

  describe 'sort' do
    let(:limit) { 3 }
    let!(:book_1) { create(:book) } # rubocop:disable RSpec/LetSetup
    let!(:book_2) { create(:book) }
    let!(:book_3) { create(:book) }
    let!(:book_4) { create(:book) }

    it do
      expect(query_obj.call(limit)).to eq([book_4, book_3, book_2])
    end
  end
end
