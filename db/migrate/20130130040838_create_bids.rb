class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :team_id
      t.integer :user_id
      t.decimal :price
      t.boolean :accepted

      t.timestamps
    end
  end
end
