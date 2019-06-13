class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :caption
      t.text :description
      t.float :price
      t.datetime :date_of_publication
      t.string :image
      t.float :height
      t.float :width
      t.float :depth
      t.string :material
      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end
