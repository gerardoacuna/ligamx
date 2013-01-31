class BidsController < ApplicationController
	def new
		@bid = Bid.new	
	end

  def create
  	@bid = Bid.new(params[:bid])
  	if @bid.save
  		redirect_to market_path, notice: "You made a bid."
  	else
  		render action: "new"
  	end
  end
end
