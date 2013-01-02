class Team < ActiveRecord::Base
  attr_accessible :name, :position, :matches_attributes

  has_many :stocks
  has_many :matches

  accepts_nested_attributes_for :matches, allow_destroy: true

  def initial_stocks_available
    return 60
  end

  def initial_stock_value
    return 10
  end

	def total_stocks_sold
    stocks.to_a.sum { |stock| stock.quantity }
  end

  def stocks_available
    initial_stocks_available - total_stocks_sold
  end

  def current_value
  	current_value = initial_stock_value
    slope = 0.588235
  	matches.each do |match|
  		if match.result == "win"
  			current_value *= 1 + (match.position * slope + 4.411765) / 100
  		elsif match.result == "lose"
  			current_value *= 1 + (match.position * slope - 15.588235) / 100
  		else
  			current_value *= 1 + (match.position * 0.235294 - 1.23529) / 100
  		end
  	end
  	current_value
  end

end
