class User < ActiveRecord::Base
  rolify

	attr_accessible :email, :password, :password_confirmation, :remember_me, :credit
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :stocks
  has_many :transactions

  def buy_stock(team_id, team_value)
    stock = stocks.find_by_team_id_and_price(team_id, team_value)
  	if stock
      stock.quantity += 1
  	else
  		stock = stocks.build(team_id: team_id, price: team_value)
  	end
  	stock
  end

  def sell_stock(stock_id)
    stock = stocks.find(stock_id)
    transaction = transactions.build(stock_id: stock_id)
    if stock.quantity > 0
      stock.quantity -= 1
      transaction.update_attributes(initial_value: stock.price, final_value: stock.team.current_value, roi: stock.transaction_return)
    else
      errors.add(:base, 'You can not sell this stock.')
      return false
    end
    transaction
    stock
  end

  def initial_available_credit
    return 300
  end

  def total_portfolio_value
    current_portfolio_value + available_credit
  end

  def transaction_gains
    transactions.to_a.sum { |transaction| transaction.roi }
  end

  def available_credit
    initial_available_credit - total_credit_spent + total_credit_earned - current_portfolio_assets
  end

  def current_portfolio_assets
    stocks.to_a.sum { |stock| stock.total_purchase_value }
  end

  def current_portfolio_value
    stocks.to_a.sum { |stock| stock.total_current_value }
  end

  def current_portfolio_gains
    stocks.to_a.sum { |stock| stock.portfolio_return }
  end

  def total_credit_spent
    transactions.to_a.sum { |transaction| transaction.initial_value }
  end

  def total_credit_earned
    transactions.to_a.sum { |transaction| transaction.final_value }
  end

end
