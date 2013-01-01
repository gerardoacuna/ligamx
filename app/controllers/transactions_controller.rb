class TransactionsController < ApplicationController
	def create
		@user = current_user
		stock = Stock.find(params[:stock_id])
		@transaction = @user.sell_stock(stock.id)

		respond_to do |format|
			if @transaction.save
        format.html { redirect_to root_url, notice: "Succesfully sold stock." }
        format.json { render json: @transaction, status: :created, location: @transaction }
      else
        format.html { render action: "new" }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
		end
	end
end
