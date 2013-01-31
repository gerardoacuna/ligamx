class TeamsController < ApplicationController
  def index
    @teams = Team.order("position")
    @bid = Bid.new(params[:bid])

    respond_to do |format|
      format.html
      format.json { render json: @teams }
    end
  end

  def show
    @team = Team.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @team }
    end
  end
end
