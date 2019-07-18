RSpec.describe 'Cart', type: :feature do
  let!(:category) { create(:category) }
  let!(:book) { create(:book, category: category) }

  it 'check cart must be hidden' do
    visit root_path
    expect(page).not_to have_css '.shop-icon'
  end

  describe 'Add new order items' do
    it 'from shop' do
      visit books_path
      expect(OrderItem.count).to eq(0)
      find('.thumbnail.general-thumbnail').hover
      find('.btn.thumb-hover-link').click
      expect(page).to have_css '.shop-icon', text: '1'
      expect(page).to have_content I18n.t('order_item.success_update')
      expect(OrderItem.count).to eq(1)
    end

    it 'from home page' do
      visit root_path
      expect(OrderItem.count).to eq(0)
      find('.thumbnail.general-thumbnail').hover
      find('.btn.thumb-hover-link').click
      expect(page).to have_css '.shop-icon', text: '1'
      expect(page).to have_content I18n.t('order_item.success_update')
      expect(OrderItem.count).to eq(1)
    end

    it 'two order items from book page' do
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

  it 'Add quantity to order item in cart' do
    visit books_path
    find('.thumbnail.general-thumbnail').hover
    find('.btn.thumb-hover-link').click
    find('.shop-quantity').click
    expect(OrderItem.count).to eq(1)
    find('.fa.fa-plus').click
    expect(page).to have_content I18n.t('order_item.success_update')
    expect(OrderItem.find_by(book_id: book.id).quantity).to eq(2)
  end

  it 'try to set order item quantity less than 1' do
    visit books_path
    find('.thumbnail.general-thumbnail').hover
    find('.btn.thumb-hover-link').click
    find('.shop-quantity').click
    find('.fa.fa-minus').click
    expect(page).to have_text(I18n.t('order_item.error_update'))
    expect(OrderItem.find_by(book_id: book.id).quantity).to eq(1)
  end

  it 'destroy order item' do
    visit books_path
    find('.thumbnail.general-thumbnail').hover
    find('.btn.thumb-hover-link').click
    find('.shop-quantity').click
    expect(OrderItem.count).to eq(1)
    find('.close.general-cart-close').click
    expect(page).to have_text(I18n.t('order_item.success_delete'))
    expect(OrderItem.count).to eq(0)
  end
end
