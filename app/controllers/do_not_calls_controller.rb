class DoNotCallsController < ApplicationController

  def index
    @do_not_calls = Do_Not_Call.all
    #List all the do not calls grouped by territory and orderd by address.
  end

  def create
    @do_not_call = Do_Not_Call.create(do_not_call_params)
    @territory = Territory.find_by_id(params[:territory_id])
    #Create the do_not_call and redirect to the associated do not calls territory.

    redirect_to "territory/#{@territory}"
  end

  def show
    @territory = Territory.find_by_id(params[:id])
    #Find the do_not_calls through the territory.
  end

  private

  def do_not_call_params
      params[:do_not_call].permit(:territory_id, :address, :street, :note, :date)
  end
end
