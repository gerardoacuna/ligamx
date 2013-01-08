class Admin::SchedulesController < AdminController
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

  def new
    @schedule = Schedule.new

    respond_to do |format|
      format.html
      format.json { render json: @schedule }
    end
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def create
    @schedule = Schedule.new(params[:schedule])

    respond_to do |format|
      if @schedule.save
        format.html { redirect_to [:admin, @schedule], notice: 'Schedule was successfully created.' }
        format.json { render json: @schedule, status: :created, location: @schedule }
      else
        format.html { render action: "new" }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @schedule = Schedule.find(params[:id])

    respond_to do |format|
      if @schedule.update_attributes(params[:schedule])
        format.html { redirect_to [:admin, @schedule], notice: 'Schedule was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy

    respond_to do |format|
      format.html { redirect_to admin_schedules_url }
      format.json { head :no_content }
    end
  end
end
