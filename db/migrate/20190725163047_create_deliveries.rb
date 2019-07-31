class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.string :name
      t.string :min_days
      t.string :max_days
      t.decimal :price, precision: 10, scale: 2
      t.timestamps
    end
  end
end
