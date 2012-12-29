class AddDefaultToQuantity < ActiveRecord::Migration
  def change
  	remove_column :stocks, :quantity
  	add_column :stocks, :quantity, :integer, default: 1
  end
end
