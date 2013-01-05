class Admin::StocksController < AdminController

  def destroy
    @stock = Stock.find(params[:id])
    @stock.destroy

    respond_to do |format|
      format.html { redirect_to admin_teams_url }
      format.json { head :no_content }
    end
  end
end