class ChangePriceToNumeric < ActiveRecord::Migration
  def up
  	remove_column :stocks, :price
  	add_column :stocks, :price, :numeric
  end

  def down
  end
end
