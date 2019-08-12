class CreateBookMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :book_materials do |t|
      t.belongs_to :material, foreign_key: true
      t.belongs_to :book, foreign_key: true
      t.timestamps
    end
  end
end
