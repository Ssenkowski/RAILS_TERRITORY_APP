class TerritoryController < ApplicationController

  def index
      #Show all the territories
      @territories = Territory.all
  end

  def create
    @territory = Territory.create(territory_params)
  end

  def show
    #show an individual territory
    @territory = Territory.find_by_id([:id])
    @publisher = Publisher.find_by_id(@territory.publisher_id)
  end

  private

  def territory_params
    params[:territory].permit(:number, :designation, :street_names, :sign_out_date, :publisher_name, :campaign_work?, :house_to_house_record_id, :do_not_calls_id, :completed_date, :card_lost?)
  end
end
