class Territory < ApplicationRecord
  belongs_to :congregation
  scope :signed_out, -> { where(signed_out: "true")}

  validates_presence_of :number, :message => "can't be empty"
  validates_presence_of :designation, :message => "can't be empty"

  def sign_out
    publisher_id = current_user.publisher_id
    @current_publisher = Publisher.find_by_id(publisher_id)
    @current_publisher.territory_id = @territory.id
    @current_publisher.save

    @territory.sign_out_date = DateTime.now
    @territory.save
  end

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

  def card_lost

  end

  def recorded_in_book?

  end
end
