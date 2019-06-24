# RSpec.describe BooksController, type: :controller do
#   describe '.index' do
#     before { get :index }
#
#     it 'renders the homepage template' do
#       expect(subject).to render_template(:index)
#     end
#
#     it 'have status 200' do
#       expect(response).to have_http_status(200)
#     end
#
#     context 'have valid instance variables' do
#       it { expect(assigns(:books)).to be_kind_of(ActiveRecord::Relation) }
#       it { expect(assigns(:current_filter)).to be_kind_of(String) }
#     end
#   end
# end
