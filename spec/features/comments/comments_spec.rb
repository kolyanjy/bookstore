RSpec.describe 'Comments create', type: :feature do
  let(:category) { create(:category) }
  let(:user) { create(:user) }
  let(:valid_input) { 'asdasdasdasd' }
  let(:book) { create(:book, category: category) }
  let(:comment) { create(:comment, book: book) }

  it ' path user no login' do
    visit book_path(book)
    expect(page).to have_text(I18n.t('comment.review', count: 0))
    expect(page).not_to have_text(I18n.t('comment.write_a_review'))
  end

  it 'try to add comment with valid inputs' do
    login_as(user, scope: :user)
    visit book_path(book)
    expect(page).to have_text(I18n.t('comment.review', count: 0))
    find('label[for=comment_mark_3]').click
    fill_in 'comment_title', with: valid_input
    fill_in 'comment_description', with: valid_input
    click_on(I18n.t('btn.post'))
    expect(page).to have_text(I18n.t('comment.review', count: 0))
    expect(Comment.count).to eq(1)
  end

  it 'view verified comment' do
    comment
    visit book_path(book)
    expect(page).to have_text(I18n.t('comment.review', count: 1))
  end

  it 'try to add comment with invalid inputs' do
    login_as(user, scope: :user)
    visit book_path(book)
    expect(page).to have_text(I18n.t('comment.review', count: 0))
    click_on(I18n.t('btn.post'))
    expect(page).to have_content I18n.t('comment.comment_failed_create')
    expect(Comment.count).to eq(0)
  end
end
