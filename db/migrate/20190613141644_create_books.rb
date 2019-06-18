class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name
      t.text :description
      t.decimal :price,  precision: 10, scale: 2
      t.date :date_of_publication
      t.string :image
      t.integer :height
      t.integer :width
      t.integer :depth
      t.references :material
      t.references :category
      t.timestamps
    end
  end
end
