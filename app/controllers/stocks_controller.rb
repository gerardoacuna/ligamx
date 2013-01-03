class StocksController < ApplicationController
  def create
  	@user = current_user
		team = Team.find(params[:team_id])
    @stock = @user.buy_stock(team.id, team.current_value)

    respond_to do |format|
      if @stock.save
        format.html { redirect_to teams_path, notice: "You bought #{team.name} stock." }
        format.json { render json: @stock, status: :created, location: @stock }
      else
        format.html { render action: "new" }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end
end
