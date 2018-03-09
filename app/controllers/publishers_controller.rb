class PublishersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]

  def index
    #Allow all users to see this page
    @publishers = Publisher.all
    if Congregation.empty?
      redirect_to new_congregations_path
    else
      render :show
    end
  end

  def new
    if Congregation.all.empty?
      redirect_to "/congregations/new"
    else
      @publisher = Publisher.new(params[:id])
    end
  end

  def create
    #Only permit an admin to create a congregation
    @publisher = Publisher.create(publisher_params)
    @congregations = Congregation.all
    @publisher.congregation_id = params[:publisher][:congregation_id][1]
    if @publisher.save
      if @publisher.email == current_user.email
        current_user.publisher_id = @publisher.id
        current_user.save
      end
      if @publisher.bag_id == nil
        @bag = Bag.create(publisher_id: @publisher.id)
        @publisher.bag_id = @bag.id
      end
       @bag = Bag.find_by_id(@publisher.bag_id)
      redirect_to "/publishers/#{@publisher.id}"
    else
      render :new
    end
  end

  def edit
    set_congregation
  end

  def update
    @publisher = Publisher.update(publisher_params)
  end

  def show
    set_publisher
    set_congregation
    if @publisher.bag_id == nil
      @bag = Bag.create(publisher_id: @publisher.id)
      @publisher.bag_id = @bag.id
    end
    @bag = Bag.find_by_id(@publisher.bag_id)
    #Display the current_user and congregation news throught the '_header' partial.
    #if params[:territory_id]
    #@territory = Territory.find_by_id(@publisher.territory_id)
    #end
    #current_congregation
  end

  private

  def publisher_params
      params[:publisher].permit(:username, :first_name, :last_name, :congregation_id, :service_group, :territory_id, :bag_id, :email)
  end

  def set_user
    @publisher = Publisher.find_by_id(params[:id])
  end

  def set_publisher
    @publisher = Publisher.find_by_id(current_user.publisher_id)
  end

  def set_congregation
    @congregation = Congregation.find_by_id(@publisher.congregation_id)
  end
end
