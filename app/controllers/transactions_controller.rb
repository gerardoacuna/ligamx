class TransactionsController < ApplicationController
	def create
		@user = current_user
		stock = Stock.find(params[:stock_id])
		@transaction = @user.sell_stock(stock.id)

		if @transaction.save
      redirect_to portfolio_url, notice: "Succesfully sold stock."
    else
      render action: "new"
    end
	end

	def accept_bid
		@user = current_user
		stock = Stock.find(params[:stock_id])
		@transaction = @user.accept_bid(stock.id)

		if @transaction.save
      redirect_to portfolio_url, notice: "Succesfully sold stock."
    else
      render action: "new"
    end
	end
end
