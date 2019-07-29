ActiveAdmin.register Coupon do
  permit_params :key, :price

  index do
    selectable_column
    column :key
    column :price do |coupon|
      number_to_currency(coupon.price)
    end
    actions
  end
end
