RSpec.describe 'Books page', type: :feature do
  let!(:book) { create(:book) }

  before { visit books_path }

  it 'Not found' do
    visit book_path(100)
    expect(page).to have_content "The page you were looking for doesn't exist."
  end
  describe 'Book page'

  it 'check book title' do
    find('.book_in_catalog').hover
    first('a.thumb-hover-link').click
    expect(page).to have_text(book.name)
  end

  it 'check read more' do
    find('.book_in_catalog').hover
    first('a.thumb-hover-link').click
    find('a.in-gold-500', text: I18n.t('book.read_more')).click
    expect(page).to have_selector('span#block_more')
  end
end
