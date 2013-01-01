class Stock < ActiveRecord::Base
  attr_accessible :team_id, :quantity, :price

  belongs_to :user
  belongs_to :team
  has_many :transactions

  def total_current_value
  	team.current_value * quantity
  end

  def total_investment_value
    if quantity > 0
      price * quantity
    else
      price
    end
  end

  def portfolio_return
    if quantity > 0
      total_current_value - total_investment_value
    else
      0
    end
  end

  def transaction_return
    team.current_value - price
  end

  def investment_return
  	total_current_value - (price * quantity)
  end

  def investment_return_percentage
  	100 * (total_current_value - total_investment_value) / total_investment_value
  end

end
