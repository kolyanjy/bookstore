ActiveAdmin.register Book do # rubocop:disable Metrics/BlockLength
  permit_params :category, :caption, :description, :price, :image, :date_of_publication, :height, :width,
                :depth, :material, author_ids: []
  index do
    selectable_column
    column :authors
    column :category
    column :caption
    column :price
    actions
  end
  form do |f|
    f.inputs 'Add/Edit Article' do
      f.input :category, as: :radio
      f.input :caption
      f.input :authors, as: :check_boxes
      f.input :description
      f.input :price
      f.input :date_of_publication
      f.input :height
      f.input :width
      f.input :depth
      f.input :material
      f.inputs 'Upload book image' do
        f.input :image, required: true, as: :file
      end
    end
    actions
  end
end
