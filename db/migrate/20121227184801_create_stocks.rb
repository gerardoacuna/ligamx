class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.integer :quantity
      t.integer :user_id
      t.integer :team_id

      t.timestamps
    end
  end
end
