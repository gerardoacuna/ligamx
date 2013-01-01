class Admin::TeamsController < AdminController

  def index
    @teams = Team.order("position")

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

  def new
    @team = Team.new

    respond_to do |format|
      format.html
      format.json { render json: @team }
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def create
    @team = Team.new(params[:team])

    respond_to do |format|
      if @team.save
        format.html { redirect_to [:admin, @team], notice: 'Team was successfully created.' }
        format.json { render json: @team, status: :created, location: @team }
      else
        format.html { render action: "new" }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @team = Team.find(params[:id])

    respond_to do |format|
      if @team.update_attributes(params[:team])
        format.html { redirect_to [:admin, @team], notice: 'Team was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    respond_to do |format|
      format.html { redirect_to admin_teams_url }
      format.json { head :no_content }
    end
  end
end