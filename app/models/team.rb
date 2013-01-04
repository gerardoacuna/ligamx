class Team < ActiveRecord::Base
  attr_accessible :name, :position, :matches_attributes

  has_many :stocks
  has_many :matches, order: "date"

  accepts_nested_attributes_for :matches, allow_destroy: true

  def can_buy_stock?(user)
    user.available_credit > current_value && stocks_available > 0 && user_stock_quantity(user).first.to_i <= 19
  end

  def match_right_now?
    closest_match_date < DateTime.now && end_match_date > DateTime.now
  end

  def closest_match_date
    closest_date = DateTime.now
    now = DateTime.now
    matches.each do |match|
      if now > closest_date && match.date < now
        closest_date = match.date
      end
    end
    return closest_date
  end

  def end_match_date
    closest_match_date + 2.5.hours
  end

  def user_stock_quantity(user)
    stocks.where("user_id = ?", user).select("sum(quantity) as total_quantity").group("team_id").map{ |stock| stock.total_quantity.to_i }
  end

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
      position = (match.position.to_i - match.rival_position.to_i) / 2 + 9.5
  		if match.result == "win"
  			current_value *= 1 + (position * slope + 4.411765) / 100
  		elsif match.result == "lose"
  			current_value *= 1 + (position * slope - 15.588235) / 100
  		elsif match.result == "tie"
  			current_value *= 1 + (position * 0.235294 - 1.23529) / 100
      else
        current_value
  		end
  	end
  	current_value
  end

end
