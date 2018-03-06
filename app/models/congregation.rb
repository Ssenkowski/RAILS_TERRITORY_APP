class Congregation < ApplicationRecord
  has_many :territories
  has_many :publishers
  has_many :do_not_call_ids, through: :territories

  def add_publisher
    @publisher = Publisher.new
  end

  def add_territory
    @territory = Territory.new
  end

  def add_meeting_times
    #display these with full day and 12 hour clock
    @weekend_meeting = weekend_meeting
    @weekday_meeting = weekday_meeting
  end

  def weekend_meeting
    @weekend_meeting #possibly set this equal to a parameter from the new congregations_controller method with a calendar date and time selector
  end

  def weekday_meeting
    @weekday_meeting #possibly set this equal to a parameter from the new congregations_controller method with a calendar date and time selector
  end
end
