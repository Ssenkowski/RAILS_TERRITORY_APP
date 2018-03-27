class Territory < ApplicationRecord
  belongs_to :congregation
  scope :signed_out, -> { where(signed_out: "true")}

  validates_presence_of :number, :message => "can't be empty"
  validates_presence_of :designation, :message => "can't be empty"

  def return(params)
    @publisher_territory = PublisherTerritory.find_by(territory_id: params[:territory][:territory_id])
    @bag = Bag.find_by_id(@publisher_territory.bag_id)
    @territory = Territory.find_by_id(@publisher_territory.territory_id)
    @territory.signed_out = "false"
    @territory.bag_id = nil
    @territory.completed_date
    @territory.save
  end

  def completed_date
    self.completed_date = DateTime.now
  end

#  def card_lost
#
#  end

#  def recorded_in_book?
#
#  end
end
