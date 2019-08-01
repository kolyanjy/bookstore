RSpec.describe 'fill_payment', type: :feature do
  let!(:delivery) { create(:delivery) }
  let(:order) { create(:order, :with_order_item, :payment_step, delivery_id: delivery.id) }
  let!(:billing_address) { create(:billing_address, addressable: order) }
  let!(:shipping_address) { create(:shipping_address, addressable: order) }

  let(:valid_number) { '1234123412341234' }
  let(:valid_name) { 'Rofl' }
  let(:valid_date) { '12/12' }
  let(:valid_cvv) { 123 }

  before do
    login_as(order.user, scope: :user)
    page.set_rack_session(order_id: order.id)
  end

  it 'Fill payment with valid params' do
    visit checkout_fill_payment_path
    fill_in 'payment_name', with: valid_name
    fill_in 'payment_date', with: valid_date
    fill_in 'payment_number', with: valid_number
    fill_in 'payment_cvv', with: valid_cvv
    click_on(I18n.t('btn.save_and_continue'))
    expect(page).to have_current_path checkout_fill_confirm_path
  end

  it 'Fill payment with invalid params' do
    visit checkout_fill_payment_path
    fill_in 'payment_name', with: ''
    fill_in 'payment_date', with: ''
    fill_in 'payment_number', with: ''
    fill_in 'payment_cvv', with: ''
    click_on(I18n.t('btn.save_and_continue'))
    expect(page).to have_selector('.invalid-feedback', count: 4)
    expect(page).to have_current_path checkout_fill_payment_path
  end
end
