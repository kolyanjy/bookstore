ActiveAdmin.register Book do # rubocop:disable Metrics/BlockLength
  permit_params :category_id, :name, :description, :price, :image, :date_of_publication, :height, :width,
                :depth, :material_id, author_ids: []
  index do
    selectable_column
    column :authors
    column :category
    column :name
    column :price
    actions
  end
  form do |f|
    f.inputs t('activeadmin.book_article') do
      f.input :category, as: :radio
      f.input :name
      f.input :authors, as: :check_boxes
      f.input :description
      f.input :price
      f.input :date_of_publication
      f.input :height
      f.input :width
      f.input :depth
      f.input :material, as: :radio
      f.inputs t('activeadmin.upload_image') do
        f.input :image, required: true, as: :file
      end
    end
    actions
  end
end
