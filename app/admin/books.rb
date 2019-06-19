ActiveAdmin.register Book do
  decorate_with BookDecorator

  permit_params :category_id, :name, :description, :price, :image, :date_of_publication, :height, :width,
                :depth, :material_id, author_ids: []

  index do
    selectable_column
    column :image do |book|
      image_tag(book.image || default_url)
    end
    column :authors do |book|
      book.authors.map do |author|
        link_to author.full_name, admin_author_path(author)
      end
    end
    column :category
    column :name
    column :price
    actions
  end

  form do |f|
    f.inputs t('activeadmin.book_article') do
      f.input :category, as: :radio
      f.input :name
      f.input :authors, as: :check_boxes, collection: Author.all.decorate
      f.input :description
      f.input :price
      f.input :date_of_publication
      f.input :height
      f.input :width
      f.input :depth
      f.input :materials, as: :check_boxes
      f.inputs t('activeadmin.upload_image') do
        f.input :image, required: true, as: :file
      end
    end
    actions
  end
end
