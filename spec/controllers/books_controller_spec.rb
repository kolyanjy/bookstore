RSpec.describe BooksController, type: :controller do
  subject(:controller) { described_class.new }

  describe '#index' do
    before { get :index }

    it 'check renders the homepage template, status and variable' do
      expect(controller).to render_template(:index)
      expect(response).to have_http_status(:ok)
      expect(assigns(:books)).to be_kind_of(Draper::CollectionDecorator)
    end
  end

  describe '#show' do
    let(:book) { create(:book) }

    it do
      get :show, params: { id: book.id }
      expect(response).to be_successful
    end
  end
end
