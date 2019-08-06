ActiveAdmin.register Order do
  permit_params :status

  config.filters = false
  config.current_filters = false
  actions :index, :edit, :update

  scope :in_progress, default: true
  scope :in_delivery
  scope :delivered
  scope :canceled

  index do
    selectable_column

    column :number
    column :status
    column :created_at

    actions
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :status, as: :select, collection: Order::FINISH_STATUSES
      f.actions
    end
  end
end
