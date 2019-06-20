ActiveAdmin.register Book do
  decorate_with BookDecorator
  includes(:authors, :materials, :book_images, :category)
  permit_params(:category_id, :name, :description, :price, :image, :date_of_publication, :height, :width,
                :depth, material_ids: [], author_ids: [], book_images_attributes: %i[image id _destroy])

  index do
    selectable_column
    column :image do |book|
      image_tag(book.first_book_image(:small_img))
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
        f.has_many :book_images, allow_destroy: true do |b|
          b.input :image
        end
      end
    end
    actions
  end
end
