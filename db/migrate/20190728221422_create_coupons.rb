class CreateCoupons < ActiveRecord::Migration[5.2]
  def change
    create_table :coupons do |t|
      t.string :key
      t.decimal :price, precision: 10, scale: 2
      t.timestamps
    end
  end
end
