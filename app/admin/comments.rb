ActiveAdmin.register Comment, as: 'CommentsForBook' do
  permit_params :title, :description, :mark, :verified, :user_id, :book_id

  index do
    selectable_column
    column :title
    column :description
    column :mark
    column :verified
    column :user
    column :book

    actions
  end
end
