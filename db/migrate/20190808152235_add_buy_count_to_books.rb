class AddBuyCountToBooks < ActiveRecord::Migration[5.2]
  def self.up
    add_column :books, :buy_count, :integer, null: false, default: 0
  end

  def self.down
    remove_column :books, :buy_count
  end
end
