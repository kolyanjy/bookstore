RSpec.feature 'Comments create', type: :feature do
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
    find('label[for=comments_mark_3]').click
    within('.simple_form.comments') do
      fill_in 'comments_title', with: valid_input
      fill_in 'comments_description', with: valid_input
    end
    click_on(I18n.t('btn.post'))
    expect(page).to have_text(I18n.t('comment.review', count: 0))
    expect(Comment.count).to eq(1)
  end

  it 'view verified comment' do
    visit book_path(book)
    expect(page).to have_text(I18n.t('comment.review', count: 1))
  end

  it 'try to add comment with invalid inputs' do
    login_as(user, scope: :user)
    visit book_path(book)
    expect(page).to have_text(I18n.t('comment.review', count: 0))
    click_on(I18n.t('btn.post'))
    expect(page).to have_text(I18n.t('comment.review', count: 0))
    expect(page).to have_content (I18n.t('comment.comment_failed_create'))
  end
end
