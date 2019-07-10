RSpec.describe Home::TakeSliderBooks do
  subject(:result) { described_class.call }

  before { create_list(:book, 5) }

  describe 'interactor response' do
    it 'count of book' do
      expect(result.slider_books.count).to eq(Home::TakeSliderBooks::NUMBER_SLIDER)
    end

    it 'check decorate' do
      expect(result.slider_books).to be_kind_of(Draper::CollectionDecorator)
    end
  end
end
