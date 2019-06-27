RSpec.describe 'Books page', type: :feature do
  let!(:book) { create(:book) }

  it 'Not found' do
    visit book_path(100)
    expect(page).to have_content "The page you were looking for doesn't exist."
  end

  it 'Click book link' do
    visit books_path
    first('a.thumb-hover-link').click
    expect(page).to have_text(book.name)
  end
end
