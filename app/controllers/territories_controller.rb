class TerritoriesController < ApplicationController

  def index
      #Show all the territories for the administrators
      @territories = []
      @territories << Territory.all
      @territories = @territories.flatten
      @territories
      #Show only the next 5-10 availbable territories by last completed date with oldest date first to all publishers.
  end

  def new
    @congregation = Congregation.find_by_id(params[:congregation_id])
    @territory = Territory.new(congregation_id: params[:congregation_id])
  end

  def create
    @territory = Territory.new(territory_params)
    @territory.congregation_id = params[:congregation_id]
    @territory.save
    @congregation = Congregation.find_by_id(@territory.congregation_id)

    redirect_to "congregations/#{@congregation.id}/territories/#{@territory.id}"
  end

  def update
    @publisher = Publisher.find_by_id(current_user.publisher_id)
    if @publisher.bag_id == nil
      @bag = Bag.create(publisher_id: @publisher.id)
      @publisher.bag_id = @bag.id
    end
     @bag = Bag.find_by_id(@publisher.bag_id)
     @bag.sign_out_territory(params[:territory][:territory_id])
     @publisher.save

    redirect_to "/publishers/#{@publisher.id}"
  end

  def edit
  end

  def show
    #show an individual territory
    @congregation = Congregation.find_by_id(params[:congregation_id])
    @territory = Territory.find_by_id(params[:id])
    @publisher = Publisher.find_by_id(current_user.publisher_id)
  end

  private

  def territory_params
    params.require(:territory).permit(:number, :designation, :congregation_id)
  end
end
