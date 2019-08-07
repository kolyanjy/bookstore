RSpec.describe Books::SliderBooksQuery do
  subject(:result) { described_class.new.call }

  before { create_list(:book, 5) }

  describe 'interactor response' do
    it 'count of book' do
      expect(result.count).to eq(Home::TakeSliderBooks::NUMBER_SLIDER)
    end

    it 'check decorate' do
      expect(result).to be_kind_of(Draper::CollectionDecorator)
    end
  end
end
