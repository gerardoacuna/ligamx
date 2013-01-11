# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  credit                 :decimal(, )
#  username               :string(255)
#

class User < ActiveRecord::Base
  rolify

	attr_accessible :email, :password, :password_confirmation, :remember_me, :credit, :username, :login
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, :presence => true

  has_many :stocks
  has_many :transactions

  attr_accessor :login

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

  def self.order_by_portfolio
    users = all
    users = users.sort { |a,b| b.total_portfolio_value <=> a.total_portfolio_value}
  end

  def self.top_ten
    order_by_portfolio.first(10)
  end

  #TODO Get user ranking.
  def rank
    # self.order_by_portfolio
  end

  def total_return_percentage
    100 * (total_portfolio_value - initial_available_credit) / initial_available_credit
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

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

end
