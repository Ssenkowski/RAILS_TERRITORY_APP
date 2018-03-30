class TerritoriesController < ApplicationController

  def index
    @territories = Territory.all
  end

  def new
    if current_user.admin
      set_congregation
      @territory = Territory.new(congregation_id: params[:congregation_id])
    else
      flash[:notice] = "Sorry your not authorized to do this, if there are not territories please talk to your territory servant or overseer."
      redirect_to publisher_path(current_user.publisher_id)
    end
  end

  def create
    @territory = Territory.new(territory_params)
    set_congregation
    @territory.congregation_id = params[:congregation_id]
    if @territory.save

      redirect_to "/congregations/#{@congregation.id}/territories"
    else
      render "new"
    end
  end

  def update
    set_publisher
    sign_out_or_return_territory
    @publisher.save

    redirect_to "/publishers/#{@publisher.id}"
  end

  def edit
  end

  def show
    set_congregation
    set_publisher
    set_view_publisher
    set_bag
    @territory = Territory.find_by_id(params[:id])
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

      def set_view_publisher
        @view_publisher = Publisher.find_by_id(params[:view_publisher_id])
      end

      def set_bag
        @bag = Bag.find_by_id(@publisher.bag_id)
      end

      #----------------------------------------------------------------
      # Methods specific to signing out and returning territories below
      #----------------------------------------------------------------

      def set_publisher_territory
        @publisher_territory = PublisherTerritory.find_by(params[:id])
      end

      def sign_out_or_return_territory
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
      end
end
