RSpec.describe 'Fill confirm', type: :feature do
  let!(:delivery) { create(:delivery) }
  let!(:payment) { create(:payment, order_id: order.id) }
  let(:order) { create(:order, :with_order_item, :confirm_step, delivery_id: delivery.id) }
  let!(:billing_address) { create(:billing_address, addressable: order) }
  let!(:shipping_address) { create(:shipping_address, addressable: order) }

  before do
    allow(Orders::Check).to receive(:call).and_return(double(order: order)) # rubocop:disable RSpec/VerifiedDoubles
    login_as(order.user, scope: :user)
    page.set_rack_session(order_id: order.id)
  end

  it 'Go next step Complet' do
    visit checkout_fill_confirm_path
    click_on(I18n.t('btn.save_and_continue'))
    expect(page).to have_current_path checkout_fill_complete_path(order.number)
    expect(order.status).to eq('in_progress')
  end

  it 'Go past step Address' do
    visit checkout_fill_confirm_path
    click_link(I18n.t('checkout.checkout_step.fill_address'))
    expect(page).to have_current_path checkout_fill_address_path
  end

  it 'Go past step Delivery' do
    visit checkout_fill_confirm_path
    click_link(I18n.t('checkout.checkout_step.fill_delivery'))
    expect(page).to have_current_path checkout_fill_delivery_path
  end

  it 'Go past step Payment' do
    visit checkout_fill_confirm_path
    click_link(I18n.t('checkout.checkout_step.fill_payment'))
    expect(page).to have_current_path checkout_fill_payment_path
  end
end
