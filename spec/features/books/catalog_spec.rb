RSpec.describe 'catalog', type: :feature do
  let(:book_amount) { 15 }

  describe 'filter' do
    before { visit books_path }

    it 'cahnge filter' do
      within '.dropdown-filter' do
        find('.dropdown-toggle').click
        find('a.collapse-link', text: I18n.t('filters.title_desc')).click
        expect(page).to have_content(I18n.t('filters.title_desc'))
      end
    end
  end

  describe 'book_in_catalog' do
    let!(:book) { create(:book) }

    before { visit books_path }

    it 'check book items' do
      expect(page).to have_selector('.title', text: book.name)
      expect(page).to have_content(book.price)
    end
  end

  describe 'pagination' do
    before do
      create_list(:book, book_amount)
      visit books_path
    end

    it 'check books quantity on first page' do
      expect(page).to have_selector('.book_in_catalog', count: 12)
    end

    it 'check books quantity on second page' do
      find('a.page-link', text: '2').click
      expect(page).to have_selector('.book_in_catalog', count: book_amount - CreateCollection::BOOKS_ON_PAGE)
    end
  end
end
