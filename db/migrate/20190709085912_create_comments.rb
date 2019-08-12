class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :title
      t.text :description
      t.integer :mark, default: 0
      t.boolean :verified, default: false
      t.boolean :approved, default: false
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.timestamps
    end
  end
end
