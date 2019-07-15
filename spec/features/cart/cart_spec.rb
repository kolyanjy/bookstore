RSpec.feature 'Cart', type: :feature do
  let!(:category) { create(:category) }
  let!(:book) { create(:book, category: category) }

  it 'check cart must be hidden' do
    visit root_path
    expect(page).not_to have_css '.shop-icon'
  end

  it 'Add new order item' do
    visit books_path
    expect(OrderItem.count).to eq(0)
    find('.thumbnail.general-thumbnail').hover
    find('.btn.thumb-hover-link').click
    expect(page).to have_css '.shop-icon', text: '1'
    expect(OrderItem.count).to eq(1)
  end

  it 'Add two order items from book page' do
    visit book_path(book.id)
    expect(OrderItem.count).to eq(0)
    within('a#plus') do
      find('.fa.fa-plus').click
    end
    find('button', text: 'Add to Cart').click
    expect(page).to have_content I18n.t('order_item.success_update')
    expect(page).to have_css '.shop-icon', text: '2'
    expect(OrderItem.count).to eq(1)
  end
end
