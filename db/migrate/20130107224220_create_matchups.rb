class CreateMatchups < ActiveRecord::Migration
  def change
    create_table :matchups do |t|
      t.integer :team1_id
      t.integer :team2_id
      t.integer :week_id

      t.timestamps
    end
  end
end
