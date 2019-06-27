RSpec.describe 'catalog', type: :feature do
  describe 'filter' do
    it 'cahnge filter' do
      visit books_path
      within 'main' do
        expect(page).to have_content(I18n.t('filters.title_asc'))
        find('.dropdown-toggle').click
        find('a.collapse-link', text: I18n.t('filters.title_desc')).click
        expect(page).to have_content(I18n.t('filters.title_desc'))
      end
    end
  end

  describe 'pagination' do
    let(:books_quantity) { 15 }

    before { books_quantity.times { create(:book) } }

    it 'check books quantity on first page' do
      visit books_path
      expect(page).to have_selector('.book_in_catalog', count: BooksController::BOOKS_ON_PAGE)
    end

    it 'check books quantity on second page' do
      visit books_path
      find('a.page-link', text: '2').click
      expect(page).to have_selector('.book_in_catalog', count: books_quantity - BooksController::BOOKS_ON_PAGE)
    end
  end
end
