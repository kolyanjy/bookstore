RSpec.describe 'Comments', type: :feature do
  let!(:category) { create(:category) }
  let!(:book) { create(:book, category: category) }
  let(:user) { create(:user) }

  describe 'review form' do
    context 'when user no login' do
      it 'visit book path user no login' do
        visit book_path(book)
        expect(page).not_to have_text(I18n.t('comment.write_a_review'))
      end
    end

    context 'when user loged in' do
      before { login_as(user, scope: :user) }

      it 'visit book path user no login' do
        visit book_path(book)
        expect(page).to have_text(I18n.t('comment.write_a_review'))
      end
    end
  end

  describe 'create' do
    before { login_as(user, scope: :user) }

    context 'with valid data' do
      let(:input) { 'asdasdasdasd' }

      it 'try to add comment with valid inputs' do
        login_as(user, scope: :user)
        visit book_path(book)
        expect(page).to have_text(I18n.t('comment.review', count: 0))
        find('label[for=comment_mark_3]').click
        fill_in 'comment_title', with: input
        fill_in 'comment_description', with: input
        click_on(I18n.t('btn.post'))
        expect(page).to have_text(I18n.t('comment.review', count: 0))
        expect(Comment.count).to eq(1)
      end
    end

    context 'with invalid data' do
      it 'try to add comment with invalid inputs' do
        visit book_path(book)
        expect(page).to have_text(I18n.t('comment.review', count: 0))
        click_on(I18n.t('btn.post'))
        expect(page).to have_content I18n.t('comment.comment_failed_create')
        expect(Comment.count).to eq(0)
      end
    end
  end

  describe 'view verified comment' do
    before { create(:comment, book: book) }

    it do
      visit book_path(book)
      expect(page).to have_text(I18n.t('comment.review', count: 1))
    end
  end
end
