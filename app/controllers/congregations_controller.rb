class CongregationsController < ApplicationController
  def index
    #Allow all users to see this page
    @congregations = Congregation.all
    if current_user.publisher_id != nil
      @publisher = Publisher.find_by_id(current_user.publisher_id)
      @congregation = Congregation.find_by_id(@publisher.congregation_id)
    else
      redirect_to new_congregation_path
    end
  end

  def new
    @congregation = Congregation.new
  end

  def create
    #Only permit an admin to create a congregation
    @congregation = Congregation.create(congregation_params)

    redirect_to "/congregations/#{@congregation.id}"
  end

  def edit
    @congregation = Congregation.find_by_id(params[:id])

  end

  def update

  end

  def show
    if current_user.publisher_id
      @publisher = Publisher.find_by_id(current_user.publisher_id)
    end
    if Congregation.all.empty?
      redirect_to congregations_path
    else
      if @publisher
        @congregation = Congregation.find_by_id(@publisher.congregation_id)
      else
        @congregation = Congregation.find_by_id(params[:id])
      end
      if current_user.publisher_id == nil
        redirect_to new_publisher_path
      else
        @publisher = Publisher.find_by_id(current_user.publisher_id)
      end
    end
  end

  private

  def congregation_params
      params[:congregation].permit(:name, :address, :street, :number, :meeting_times, :saturday_field_service_start_time, :saturday_meet_at_the_hall, :wednesday_evening_service_meeting?, :wednesday_evening_service_meeting_date_time, :scheduled_public_talk_title, :special_talk_date_time, :special_talk_title, :memorial_date_time, :regional_convention_date_time, :regional_convention_theme, :co_visit_start_date, :co_visit_end_date, :thirty_hour_aux_months, :publisher_id, :territory_id)
  end
end
