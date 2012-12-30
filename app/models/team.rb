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
  	slope = 
  	matches.each do |match|
  		if match.result == "win"
  			current_value *= position * slope + 4.411765
  		elsif match.result == "lose"
  			current_value *= position * slope + 15.588235
  		else
  			current_value
  		end
  	end
  	current_value
  end

end
