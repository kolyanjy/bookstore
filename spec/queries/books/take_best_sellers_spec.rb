RSpec.describe Books::BestSellersQuery do
  subject(:result) { described_class.new.call }

  before { create_list(:book, 5) }

  describe 'interactor response' do
    it 'count of book' do
      expect(result.count).to eq(Home::TakeBestSellers::NUMBER_BEST_SELLER)
    end

    it 'check decorate' do
      expect(result).to be_kind_of(Draper::CollectionDecorator)
    end
  end
end
