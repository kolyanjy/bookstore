RSpec.describe 'Coupon', type: :feature do
  let(:order) { create(:order, :with_order_item) }
  let!(:coupon) { create(:coupon) }
  let(:invalid_coupon) { '1488' }

  before do
    login_as(order.user, scope: :user)
    page.set_rack_session(order_id: order.id)
    visit cart_path
  end

  it 'success update coupon' do
    within('#new_coupon') do
      fill_in 'coupon[key]', with: coupon.key
    end
    click_on(I18n.t('coupon.coupon'))
    expect(Order.first.coupon_id).to eq(coupon.id)
    expect(page).to have_text(I18n.t('coupon.success_update'))
  end

  it 'failed update coupon' do
    within('#new_coupon') do
      fill_in 'coupon[key]', with: invalid_coupon
    end
    click_on(I18n.t('coupon.coupon'))
    expect(Order.first.coupon_id).to eq(nil)
    expect(page).to have_text(I18n.t('coupon.not_found'))
  end
end
