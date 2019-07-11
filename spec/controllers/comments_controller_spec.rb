RSpec.describe CommentsController, type: :controller do
  let!(:user) { create(:user) }
  let!(:book) { create(:book) }

  describe '#create' do
    before { sign_in user }

    context 'when result success' do
      let(:create_comment) { double(:create_comment, success?: true) }

      it do
        allow(CreateComment).to receive(:call).and_return(create_comment)
        expect(response.status).to eq(200)
        expect(controller).to set_flash[:success].to I18n.t('comment.comment_created')
        expect(controller).to redirect_to(redirect_to book_path(create_comment.book_id))
      end
    end
  end



end
