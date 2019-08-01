RSpec.describe 'fill delivery', type: :feature do
  let!(:user) { create(:user) }
  let(:order) { create(:order, :with_order_item, :delivery_step, user: user) }
  let!(:delivery) { create(:delivery) }

  before do
    login_as(order.user, scope: :user)
    page.set_rack_session(order_id: order.id)
  end

  it 'Click save button' do
    expect(Order.last.delivery_id).to eq nil
    visit checkout_fill_delivery_path
    click_on(I18n.t('btn.save_and_continue'))
    expect(page).to have_current_path checkout_fill_payment_path
    expect(Order.last.delivery_id).to eq delivery.id
  end

  it 'Go next step' do
    visit checkout_fill_delivery_path
    click_link(I18n.t('checkout.checkout_step.fill_payment'))
    expect(page).to have_current_path checkout_fill_delivery_path
  end

  it 'Go past step' do
    order
    visit checkout_fill_delivery_path
    click_link(I18n.t('checkout.checkout_step.fill_address'))
    expect(page).to have_current_path checkout_fill_address_path
  end
end
