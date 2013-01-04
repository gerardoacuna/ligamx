class Transaction < ActiveRecord::Base
  attr_accessible :stock_id, :final_value, :initial_value, :roi

  belongs_to :user
  belongs_to :stock
end
