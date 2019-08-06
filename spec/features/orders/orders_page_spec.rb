RSpec.describe 'OrdersPage page', type: :feature do
  let!(:delivery) { create(:delivery) }
  let(:order) { create(:order, :with_order_item, :in_progress_step, :with_order_number, delivery_id: delivery.id) }

  before do
    login_as(order.user, scope: :user)
    create(:billing_address, addressable: order)
    create(:payment, order_id: order.id)
    create(:shipping_address, addressable: order)
  end

  it 'Open index page for orders' do
    visit orders_path
    expect(page).to have_content I18n.t('order.my_orders')
    expect(page).to have_content order.number.to_s
    expect(page).to have_content order.decorate.order_created_at.to_s
    expect(page).to have_content order.status.split('_').join(' ').capitalize.to_s
    expect(page).to have_content order.decorate.order_summary.to_s
  end

  it 'Open show page for order' do
    visit orders_path
    click_link(order.number.to_s)
    expect(page).to have_current_path order_path(order)
    expect(page).to have_content I18n.t('checkout.complete.order_number', number: order.number)
  end
end
