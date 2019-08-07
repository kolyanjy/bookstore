RSpec.describe 'fill address', type: :feature do
  let(:order) { create(:order, :with_order_item, user: user) }
  let!(:user) { create(:user) }
  let(:valid_str) { 'testtest' }
  let(:valid_zip) { 1234 }
  let(:valid_phone) { '+380636472129' }

  before do
    login_as(order.user, scope: :user)
    page.set_rack_session(order_id: order.id)
  end

  it 'Click btn checkout' do
    visit cart_path
    find('a', text: I18n.t('btn.checkout')).click
    expect(page).to have_current_path checkout_fill_address_path
  end

  it 'Add hidden shipping address' do
    visit cart_path
    find('a', text: I18n.t('btn.checkout')).click
    expect(ShippingAddress.count).to eq(1)
    expect(BillingAddress.count).to eq(1)
    fill_in 'order_billing_address_attributes_first_name', with: valid_str
    fill_in 'order_billing_address_attributes_last_name', with: valid_str
    fill_in 'order_billing_address_attributes_address', with: valid_str
    fill_in 'order_billing_address_attributes_city', with: valid_str
    fill_in 'order_billing_address_attributes_zip', with: valid_zip
    fill_in 'order_billing_address_attributes_phone', with: valid_phone
    find('span', class: 'checkbox-icon').click
    click_on(I18n.t('btn.save_and_continue'))
    expect(BillingAddress.count).to eq(2)
    expect(ShippingAddress.count).to eq(2)
  end

  it 'Success add billing address and shipping address' do
    visit cart_path
    find('a', text: I18n.t('btn.checkout')).click
    expect(BillingAddress.count).to eq(1)
    expect(ShippingAddress.count).to eq(1)
    fill_in 'order_billing_address_attributes_first_name', with: valid_str
    fill_in 'order_billing_address_attributes_last_name', with: valid_str
    fill_in 'order_billing_address_attributes_address', with: valid_str
    fill_in 'order_billing_address_attributes_city', with: valid_str
    fill_in 'order_billing_address_attributes_zip', with: valid_zip
    fill_in 'order_billing_address_attributes_phone', with: valid_phone
    fill_in 'order_shipping_address_attributes_first_name', with: valid_str
    fill_in 'order_shipping_address_attributes_last_name', with: valid_str
    fill_in 'order_shipping_address_attributes_address', with: valid_str
    fill_in 'order_shipping_address_attributes_city', with: valid_str
    fill_in 'order_shipping_address_attributes_zip', with: valid_zip
    fill_in 'order_shipping_address_attributes_phone', with: valid_phone
    click_on(I18n.t('btn.save_and_continue'))
    expect(BillingAddress.count).to eq(2)
    expect(ShippingAddress.count).to eq(2)
  end

  it 'Failed add billing address and shipping address' do
    visit cart_path
    find('a', text: I18n.t('btn.checkout')).click
    expect(BillingAddress.count).to eq(1)
    expect(ShippingAddress.count).to eq(1)
    fill_in 'order_billing_address_attributes_first_name', with: ''
    fill_in 'order_billing_address_attributes_last_name', with: ''
    fill_in 'order_billing_address_attributes_address', with: ''
    fill_in 'order_billing_address_attributes_city', with: ''
    fill_in 'order_billing_address_attributes_zip', with: ''
    fill_in 'order_billing_address_attributes_phone', with: ''
    fill_in 'order_shipping_address_attributes_first_name', with: ''
    fill_in 'order_shipping_address_attributes_last_name', with: ''
    fill_in 'order_shipping_address_attributes_address', with: ''
    fill_in 'order_shipping_address_attributes_city', with: ''
    fill_in 'order_shipping_address_attributes_zip', with: ''
    fill_in 'order_shipping_address_attributes_phone', with: ''
    click_on(I18n.t('btn.save_and_continue'))
    expect(page).to have_selector('.invalid-feedback', count: 12)
    expect(BillingAddress.count).to eq(1)
    expect(ShippingAddress.count).to eq(1)
  end

  it 'Go next step Delivery' do
    visit cart_path
    find('a', text: I18n.t('btn.checkout')).click
    click_link(I18n.t('checkout.checkout_step.fill_delivery'))
    expect(page).to have_current_path checkout_fill_address_path
  end
end
