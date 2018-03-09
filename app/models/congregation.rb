class Congregation < ApplicationRecord
  has_many :territories
  has_many :publishers

  validates_presence_of :name, :message => "can't be empty"
  validates_presence_of :number, :message => "can't be empty"
  validates_presence_of :address, :message => "can't be empty"
  validates_presence_of :street, :message => "can't be empty"

  def territories_attributes=(territory_attributes)
    territory_attributes.values.each do |territory_attribute|
      territory = Territory.find_or_create_by(territory_attribute)
      self.territories << territory
    end
  end

  def add_publisher
    @publisher = Publisher.new
  end

  def add_territory
    @territory = Territory.new
  end

  def weekend_meeting
    @weekend_meeting #possibly set this equal to a parameter from the new congregations_controller method with a calendar date and time selector
  end

  def weekday_meeting
    @weekday_meeting #possibly set this equal to a parameter from the new congregations_controller method with a calendar date and time selector
  end
end
