class AddDefaultValueToAccepted < ActiveRecord::Migration
  def change
  	change_column :bids, :accepted, :boolean, :default => false
  end
end
