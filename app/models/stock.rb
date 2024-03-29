# == Schema Information
#
# Table name: stocks
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  team_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  quantity   :integer          default(1)
#  price      :decimal(, )
#

class Stock < ActiveRecord::Base
  attr_accessible :user_id, :team_id, :quantity, :price

  belongs_to :user
  belongs_to :team
  has_many :transactions

  def self.grouped_by_team_and_price(user)
    stocks = joins(:teams)
    stocks = where("quantity > 0 AND user_id = :user", { user: user })
    stocks = stocks.select("team_id, price, max(id) as id, sum(quantity) as total_quantity")
    stocks = stocks.group('team_id, price')
  end

  def total_stock_quantity
    self.total_quantity.to_i
  end

  def total_current_value
  	team.current_value * total_stock_quantity
  end

  def total_purchase_value
    price * total_stock_quantity
  end

  def investment_return
    total_current_value - total_purchase_value
  end

  def transaction_return
    team.current_value - price
  end

  def transaction_return_on_bid
    team.bids.first.price - price
  end

end
