RSpec.describe CommentsController, type: :controller do
  let!(:user) { create(:user) }
  let!(:book) { create(:book) }

  describe '#create' do
    before { sign_in user }

    context 'when result success' do
      let(:params) { { comment: attributes_for(:comment, user_id: user.id), book_id: book.id } }

      it do
        post :create, params: params
        expect(response.status).to eq(302)
        expect(controller).to set_flash[:success].to I18n.t('comment.comment_created')
      end
    end

    context 'when result success' do
      let(:params) { { comment: attributes_for(:comment, user_id: user.id, title: ''), book_id: book.id } }

      it do
        post :create, params: params
        expect(response.status).to eq(302)
        expect(controller).to set_flash[:danger].to I18n.t('comment.comment_failed_create')
      end
    end
  end
end
