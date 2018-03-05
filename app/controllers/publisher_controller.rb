class PublisherController < ApplicationController

  def index
    #Allow all users to see this page
    @publisher = Publisher.find_by_id(params[:id])
  end

  def create
    #Only permit an admin to create a congregation
    @publisher = Publisher.create(publisher_params)
  end

  def show
    #Display the current_user and congregation news throught the '_header' partial.
    @publisher = Publisher.find_by_id(params[:publisher_id])
    @territory = Territory.find_by_id(@publisher.territory_id)
    current_congregation
  end

  private

  def publisher_params
      params[:publisher].permit(:username, :first_name, :last_name, :congregation_id, :service_group, :territory_id)
  end
end