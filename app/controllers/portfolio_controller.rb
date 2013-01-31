class PortfolioController < ApplicationController
  def index
  	@stocks = Stock.grouped_by_team_and_price(current_user)
  	@bids = Bid.all
  end
end
