class ChangeResultDataType < ActiveRecord::Migration
  def up
  	remove_column :matches, :result
  	add_column :matches, :result, :string
  end

  def down
  end
end
