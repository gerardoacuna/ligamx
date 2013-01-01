class AddTransactionIdToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :transaction_id, :integer
  end
end
