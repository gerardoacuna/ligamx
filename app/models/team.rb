class Team < ActiveRecord::Base
  attr_accessible :name, :position, :matches_attributes

  has_many :stocks
  has_many :matches

  accepts_nested_attributes_for :matches, allow_destroy: true

	def total_stocks_sold
    stocks.to_a.sum { |stock| stock.quantity }
  end

  def current_value
  	current_value = 5
  	matches.each do |match|
  		if match.result == "win"
  			current_value *= 1.3
  		elsif match.result == "lose"
  			current_value *= 0.7
  		else
  			current_value
  		end
  	end
  	current_value
  end

end
