# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  position   :integer
#

class Team < ActiveRecord::Base
  attr_accessible :name, :position, :matches_attributes

  has_many :bids
  has_many :stocks
  has_many :matches, order: "date"

  has_many :matchups, foreign_key: "team1_id", dependent: :destroy
  has_many :home_matchups, through: :matchups, source: :team2
  has_many :reverse_matchups, foreign_key: "team2_id", class_name:  "Matchup", dependent:   :destroy
  has_many :away_matchups, through: :reverse_matchups, source: :team1

  accepts_nested_attributes_for :matches, allow_destroy: true

  def can_make_bid?(user)
    stocks_available == 0 && user.available_credit >= current_value && user_stock_quantity(user).first.to_i <= 19
  end

  def can_buy_stock?(user)
    user.available_credit >= current_value && stocks_available > 0 && user_stock_quantity(user).first.to_i <= 19
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

  def max_bid_value
    current_value * 1.1
  end

  def min_bid_value
    current_value + 0.01
  end

  def end_match_date
    closest_match_date + 2.5.hours
  end

  def user_stock_quantity(user)
    stocks.where("user_id = ?", user).select("sum(quantity) as total_quantity").group("team_id").map{ |stock| stock.total_quantity.to_i }
  end

  def initial_stocks_available
    return 110
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

  def weekly_change
    current_value - last_week_value
  end

  def current_value
  	current_value = initial_stock_value
    slope = 0.588235294117647
  	matches.each do |match|
      position = 9.5 + (match.position.to_i - match.rival_position.to_i) * 0.5
  		if match.result == "win"
  			current_value *= 1 + (position * slope + 4.41176470588235) * 0.01
  		elsif match.result == "lose"
  			current_value *= 1 + (position * slope - 15.5882352941176) * 0.01
  		elsif match.result == "tie"
  			current_value *= 1 + (position * 0.235294117647059 - 1.23529411764706) * 0.01
      else
        current_value
  		end
  	end
  	current_value
  end

  def last_week_value
    last_week_value = initial_stock_value
    slope = 0.588235294117647
    match_number = matches.length
    matches.each_with_index do |match, index|
      if index + 1 == match_number
        position = 9.5 + (match.position.to_i - match.rival_position.to_i) * 0.5
        if match.result == "win"
          last_week_value *= 1 + (position * slope + 4.41176470588235) * 0.01
        elsif match.result == "lose"
          last_week_value *= 1 + (position * slope - 15.5882352941176) * 0.01
        elsif match.result == "tie"
          last_week_value *= 1 + (position * 0.235294117647059 - 1.23529411764706) * 0.01
        else
          last_week_value
        end
      end
    end
    last_week_value
  end

end
