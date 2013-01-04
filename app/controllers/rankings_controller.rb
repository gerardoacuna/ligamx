class RankingsController < ApplicationController
  def index
  	@players = User.order_by_portfolio
  end
end
