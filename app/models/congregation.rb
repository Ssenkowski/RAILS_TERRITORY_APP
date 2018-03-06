class Congregation < ApplicationRecord
  has_many :territories
  has_many :publishers
  has_many :do_not_call_ids, through: :territories

  def add_publisher

  end

  def add_territory

  end

  def add_meeting_times

  end

  def weekend_meeting

  end

  def weekday_meeting

  end
end
