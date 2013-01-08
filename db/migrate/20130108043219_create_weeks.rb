class CreateWeeks < ActiveRecord::Migration
  def change
    create_table :weeks do |t|
      t.integer :number
      t.integer :schedule_id

      t.timestamps
    end
  end
end
