class ChangeResultDataType < ActiveRecord::Migration
  def up
  	change_column :matches, :result, :string
  end

  def down
  end
end
