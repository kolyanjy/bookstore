RSpec.describe 'QuickRegistration', type: :feature do
  let(:order) { create(:order, :with_order_item, user: nil) }
  let!(:email) { '100@gmail.com' }

  before do
    allow(Orders::Check).to receive(:call).and_return(double(order: order)) # rubocop:disable RSpec/VerifiedDoubles
    page.set_rack_session(order_id: order.id)
  end

  it 'Click checkout button, redirect to quick registration' do
    visit root_path
    find('.shop-icon', text: '1').click
    find('a', text: 'Checkout').click
    expect(page).to have_current_path new_user_registration_path(quick: true)
  end

  it 'Fill input for quick registration' do
    visit cart_path
    find('a', text: 'Checkout').click
    fill_in 'user_email', with: email
    click_on(I18n.t('checkout.authentication.sign_up'))
    expect(page).to have_current_path cart_path
  end
end
