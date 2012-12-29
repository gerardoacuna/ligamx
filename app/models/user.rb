class User < ActiveRecord::Base

	attr_accessible :email, :password, :password_confirmation, :remember_me
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :stocks

  def buy_stock(team_id)
  	stock = stocks.find_by_team_id(team_id)
  	if stock && stock.price == stock.team.current_value
  		stock.quantity += 1
  	else
  		stock = stocks.build(team_id: team_id)
  	end
  	stock
  end

end
