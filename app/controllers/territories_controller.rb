class TerritoriesController < ApplicationController

  def index
    @territories = Territory.all
    #Show all the territories and their attributes for the administrators
    #Show only the next 5-10 availbable territories by last completed date with oldest date first to all publishers.
  end

  def new
    set_congregation
    @territory = Territory.new(congregation_id: params[:congregation_id])
  end

  def create
    @territory = Territory.new(territory_params)
    @territory.congregation_id = params[:congregation_id]
    @territory.save
    @congregation = Congregation.find_by_id(@territory.congregation_id)
    redirect_to "/congregations/#{@congregation.id}/territories/#{@territory.id}"
  end

  def update
    set_publisher
    if params[:return_territory]
      @publisher_territories = @publisher.territories
      @publisher_territories.each do |t|
        set_bag
        set_publisher_territory
        if t.id == params[:id].to_i
          t.return(params)
          @publisher_territory.territory_id = nil
        end
      end
    elsif
      @publisher.bag_id == nil
        @bag = Bag.create(publisher_id: @publisher.id)
        @publisher.bag_id = @bag.id
    else
      set_bag
      @bag.sign_out_territory(params[:territory][:territory_id])
    end
    @publisher.save

    redirect_to "/publishers/#{@publisher.id}"
  end

  def edit
  end

  def show
    set_congregation
    set_publisher
    @territory = Territory.find_by_id(params[:id])
    if @territory.bag_id == nil
      @bag = Bag.find_by(publisher_id: @publisher.id)
      @territory.bag_id = @bag.id
      @territory.save
    end
  end

  private

      def territory_params
        params.require(:territory).permit(:number, :designation, :congregation_id, :bag_id, :completed_date, :sign_out_date, street_names: [:street_name_1, :street_name_2, :street_name_3, :street_name_4, :street_name_5, :street_name_6, :street_name_7, :street_name_8, :street_name_9, :street_name_10])
      end

      def set_congregation
        @congregation = Congregation.find_by_id(params[:congregation_id])
      end

      def set_publisher
        @publisher = Publisher.find_by_id(current_user.publisher_id)
      end

      def set_bag
        @bag = Bag.find_by_id(@publisher.bag_id)
      end

      def set_publisher_territory
        @publisher_territory = PublisherTerritory.find_by(params[:id])
      end
end
