RSpec.describe BooksController, type: :controller do
  subject(:controller) { described_class.new }

  describe '#index' do
    before { get :index }

    it 'renders the homepage template' do
      expect(controller).to render_template(:index)
    end

    it 'have status 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'set valid data to instance variables' do
      expect(assigns(:books)).to be_kind_of(ActiveRecord::Relation)
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
