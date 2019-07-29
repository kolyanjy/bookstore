class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :status, default: 0
      t.string :number
      t.references :user, foreign_key: true
      t.boolean :hidden_shipping_form, default: false, null: false
      t.timestamps
    end
  end
end
