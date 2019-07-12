RSpec.describe HomeController, type: :controller do
  describe '#index' do
    it do
      get :index
      expect(response).to be_successful
      expect(assigns(:best_seller)).to be_kind_of(Draper::CollectionDecorator)
      expect(assigns(:slider_books)).to be_kind_of(Draper::CollectionDecorator)
    end
  end
end
