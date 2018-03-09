class CongregationsController < ApplicationController
  def index
    #Allow all users to see this page
    @congregations = Congregation.all
    if current_publisher
      set_congregation_by_publisher
    else
      redirect_to new_publisher_path
    end
  end

  def new
    if current_user.id == 1
      current_user.update_attribute :admin, true
    end
    if current_user.admin?
      @congregation = Congregation.new
    else
      redirect_to new_publisher_path
    end
  end

  def create
    @congregation = Congregation.create(congregation_params)

    redirect_to "/congregations/#{@congregation.id}"
  end

  def edit
    @congregation = Congregation.find_by_id(params[:id])
  end

  def update

  end

  def show
    if current_publisher
      set_congregation_by_publisher
    elsif !current_publisher
      redirect_to new_publisher_path
    else !set_congregation_by_publisher
      redirect_to congregations_path
    end
  end

  private

  def congregation_params
      params[:congregation].permit(:name, :address, :street, :number, :meeting_times, :saturday_field_service_start_time, :saturday_meet_at_the_hall, :wednesday_evening_service_meeting?, :wednesday_evening_service_meeting_date_time, :scheduled_public_talk_title, :special_talk_date_time, :special_talk_title, :memorial_date_time, :regional_convention_date_time, :regional_convention_theme, :co_visit_start_date, :co_visit_end_date, :thirty_hour_aux_months, :publisher_id, :territory_id)
  end

  def current_publisher
    if current_user.publisher_id
    @publisher = Publisher.find_by_id(current_user.publisher_id)
    end
  end

  def set_congregation_by_publisher
    @congregation = Congregation.find_by_id(@publisher.congregation_id)
  end
end
