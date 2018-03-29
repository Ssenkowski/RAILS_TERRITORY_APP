class PublishersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]

  def index
    @publishers = Publisher.all

    render :index
  end

  def new
    if Congregation.all.empty?
      redirect_to "/congregations/new"
    else
      @publisher = Publisher.new(params[:id])
    end
  end

  def create
    @publisher = Publisher.create(publisher_params)
    @congregations = Congregation.all
    @publisher.congregation_id = params[:publisher][:congregation_id][1]
    if @publisher.save
      if @publisher.email == current_user.email
        current_user.publisher_id = @publisher.id
        @publisher.user_id = current_user.id
        @publisher.save
        current_user.save
      else
        flash[:notice] = "Please enter the email you signed up with."
        redirect_to new_publisher_path
      end
      create_service_bag
      set_service_bag
      redirect_to publisher_path(@publisher.id)
    else
      render :new
    end
  end

  def edit
    set_congregation
  end

  def update
    @publisher = Publisher.update(publisher_params)

    redirect_to publishers_path
  end

  def show
    set_publisher
    view_publisher
    set_congregation
    set_service_bag
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

  def view_publisher
    @view_publisher = Publisher.find_by_id(params[:id])
  end

  def set_congregation
    @congregation = Congregation.find_by_id(@publisher.congregation_id)
  end

  def set_service_bag
    @bag = Bag.find_by_id(@publisher.bag_id)
  end

  def create_service_bag
    if @publisher.bag_id == nil
      @bag = Bag.create(publisher_id: @publisher.id)
      @publisher.bag_id = @bag.id
      @publisher.save
    end
  end
end
