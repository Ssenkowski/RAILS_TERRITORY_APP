class TerritoriesController < ApplicationController

  def index
      #Show all the territories for the administrators
      @territories = Territory.all
      #Show only the next 5-10 availbable territories by last completed date with oldest date first to all publishers.
  end

  def new
    @territory = Territory.new
  end

  def create
    @territory = Territory.create(territory_params)
    @congregations = Congregation.all
    @territory.congregation_id = params[:territory][:congregation_id][1]
    @territory.save
    redirect_to "territories/#{@territory.id}"
  end

  def show
    #show an individual territory
    @territory = Territory.find_by_id(params[:id])
  end

  private

  def territory_params
    params.require(:territory).permit(:number, :designation, :congregation_id => [])
  end
end
