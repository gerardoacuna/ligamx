class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all

    respond_to do |format|
      format.html
      format.json { render json: @schedules }
    end
  end

  def show
    @schedule = Schedule.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @schedule }
    end
  end
end