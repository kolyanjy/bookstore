class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :number
      t.string :name
      t.string :date
      t.integer :cvv
      t.references :order, foreign_key: true
      t.timestamps
    end
  end
end
