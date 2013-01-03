class AddRivalPositionToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :rival_position, :integer
    rename_column :matches, :match_date, :date
  end
end
