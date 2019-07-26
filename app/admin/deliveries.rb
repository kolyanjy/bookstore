ActiveAdmin.register Delivery, as: 'checkout_delivery' do
  permit_params :name, :min_days, :max_days, :price
  config.filters = false

  index do
    selectable_column

    column :name
    column :min_days
    column :max_days
    column :price
  end
end
