class ChangeReturnToRoi < ActiveRecord::Migration
  def up
  	rename_column :transactions, :return, :roi
  end

  def down
  end
end
