RSpec.describe 'Index page', type: :feature do
  let(:category) { create(:category) }
  let!(:book) { create(:book, category: category) }
  let(:categories) { create_list(:category, 3, :with_books) }

  it 'click All books in header' do
    visit root_path
    find('li', class: 'dropdown', text: I18n.t('header.shop')).click
    click_link('All books')
    expect(page).to have_selector 'h1', text: I18n.t('word.catalog')
    expect(page).to have_current_path books_path
  end

  it 'click slider book' do
    category
    visit root_path
    find('div', class: 'general-img-wrap').find('a').click
    expect(page).to have_current_path book_path(book.id)
  end

  it 'click All books in home page' do
    visit root_path
    find('a', text: I18n.t('header.shop')).click
    find('a', text: I18n.t('header.all_books')).click
    expect(page).to have_selector 'h1', text: I18n.t('word.catalog')
    expect(page).to have_current_path books_path
  end

  it 'click shop in header' do
    category
    visit root_path
    find('li', class: 'dropdown', text: I18n.t('header.shop')).click
    find('a', class: 'filter-link', text: category.name).click
    expect(page).to have_selector 'h1', text: I18n.t('word.catalog')
  end

  it 'click button Get started' do
    categories
    visit root_path
    find('a', class: 'btn-default', text: I18n.t('home.started')).click
    categories.each do |category|
      expect(page).to have_content category.name
    end
    expect(page).to have_current_path books_path
  end
end
