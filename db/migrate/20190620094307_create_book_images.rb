class CreateBookImages < ActiveRecord::Migration[5.2]
  def change
    create_table :book_images do |t|
      t.string :image
      t.references :book, foreign_key: true
    end
  end
end
