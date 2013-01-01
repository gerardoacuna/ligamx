class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.decimal :initial_value, :precision => 8, :scale => 2
      t.decimal :final_value, :precision => 8, :scale => 2
      t.decimal :return, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
