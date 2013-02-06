class BidsController < ApplicationController
	def new
		@bid = Bid.new	
	end

  def create
  	@bid = Bid.new(params[:bid])
  	if @bid.save
      flash[:notice] = "Your bid was successfully placed."
  		redirect_to market_path
  	else
  		render action: "new"
  	end
  end

  def update
    @bid = Bid.find(params[:id])
    if @bid.update_attributes(params[:bid])
      redirect_to portfolio_path, notice: 'Bid was successfully cancelled.'
    else
      render "new"
    end
  end
end
