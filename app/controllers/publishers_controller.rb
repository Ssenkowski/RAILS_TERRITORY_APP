class PublishersController < ApplicationController

  def index
    #Allow all users to see this page
    @publisher = Publisher.find_by_id(params[:id])
  end

  def new
    @publisher = Publisher.new(params[:id])
    @congregations = Congregation.all
  end

  def create
    #Only permit an admin to create a congregation
    @publisher = Publisher.create(publisher_params)
    @congregations = Congregation.all
    @publisher.congregation_id = params[:publisher][:congregation_id][1]
    @publisher.save
    redirect_to "publishers/#{@publisher.id}"
  end

  def edit
    @publisher = Publisher.find_by_id(current_user.publisher_id)
    @congregation = Congregation.find_by_id(id: @publisher.congregation_id)
  end

  def show

    #Display the current_user and congregation news throught the '_header' partial.
    @publisher = Publisher.find_by_id(params[:id])
    #if params[:territory_id]
    #@territory = Territory.find_by_id(@publisher.territory_id)
    #end
    #current_congregation
  end

  private

  def publisher_params
      params[:publisher].permit(:username, :first_name, :last_name, :congregation_id, :service_group, :territory_id)
  end
end
