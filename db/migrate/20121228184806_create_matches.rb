class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
    	t.integer :result
    	t.integer :team_id
      t.datetime :match_date

      t.timestamps
    end
  end
end
