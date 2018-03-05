class HouseToHouseRecordsController < ApplicationController
  def index
    @house_to_house_records = House_to_house_record.all
    #List all the do not calls grouped by territory and orderd by address.
  end

  def create
    @house_to_house_record = House_to_house_record.create(house_to_house_record_params)
    @territory = Territory.find_by_id(params[:territory_id])
    #Create the house_to_house_record and redirect to the associated do not calls territory.

    redirect_to "house_to_house_record/#{@house_to_house_record.id}"
  end

  def show
    @house_to_house_record = House_to_house_record.find_by_id(params[:id])
    @territory = Territory.find_by_id(params[:territory_id])
  end

  private

  def house_to_house_record_params
      params[:house_to_house_record].permit(:territory_id, :publisher_id, :address, :street, :note_symbol, :do_not_call?, :notes, :date)
  end
end
end
