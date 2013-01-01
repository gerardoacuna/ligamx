class AddStockIdToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :stock_id, :integer
    remove_column :stocks, :transaction_id
  end
end
