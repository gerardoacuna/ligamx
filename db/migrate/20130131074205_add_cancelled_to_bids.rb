class AddCancelledToBids < ActiveRecord::Migration
  def change
    add_column :bids, :cancelled, :boolean, :default => false
  end
end
