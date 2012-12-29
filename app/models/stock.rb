class Stock < ActiveRecord::Base
  attr_accessible :team_id, :quantity

  belongs_to :user
  belongs_to :team

  after_create :assign_current_value

  def current_total_value
  	team.current_value * quantity
  end

  def total_investment
  	price * quantity
  end

  def investment_return
  	current_total_value - total_investment
  end

  def percentage_return
  	100 * (current_total_value - total_investment) / total_investment
  end

  private

  	def assign_current_value
  		team_value = team.current_value
  		self.update_attribute(:price, team_value)
  	end

end
