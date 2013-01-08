class AddDateToMatchups < ActiveRecord::Migration
  def change
    add_column :matchups, :date, :datetime
  end
end
