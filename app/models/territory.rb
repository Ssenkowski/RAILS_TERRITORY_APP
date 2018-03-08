class Territory < ApplicationRecord
  belongs_to :congregation
  scope :signed_out, -> { where(signed_out: "true")}

  def sign_out
    publisher_id = current_user.publisher_id
    @current_publisher = Publisher.find_by_id(publisher_id)
    @current_publisher.territory_id = @territory.id
    @current_publisher.save

    @territory.sign_out_date = DateTime.now
    @territory.save
  end

  def return

  end

  def completed_date

  end

  def card_lost

  end

  def recorded_in_book?

  end
end
