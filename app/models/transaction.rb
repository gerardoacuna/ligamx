class Transaction < ActiveRecord::Base
  attr_accessible :final_value, :initial_value, :roi, :stock_id

  belongs_to :user
  belongs_to :stock
end
