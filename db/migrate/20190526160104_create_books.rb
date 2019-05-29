class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :price
      t.integer :quantity
      t.text :description
      t.string :dimensions
      t.integer :year
      t.string :materials

      t.timestamps
    end
  end
end
