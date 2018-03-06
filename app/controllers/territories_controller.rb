class TerritoriesController < ApplicationController

  def index
      #Show all the territories
      @territories = Territory.all
  end

  def new
    @territory = Territory.new
  end

  def create
    @territory = Territory.create(territory_params)
    @congregations = Congregation.all
    binding.pry
    @territory.congregation_id = params[:territory][:congregation_id][1]
    @territory.save
    redirect_to "territories/#{@territory.id}"
  end

  def show
    #show an individual territory
    @territory = Territory.find_by_id([:id])
    @publisher = Publisher.find_by_id(@territory.publisher_id)
  end

  private

  def territory_params
    params[:territory].permit(:number, :designation)
  end
end
