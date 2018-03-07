class Territory < ApplicationRecord
  belongs_to :congregation
  belongs_to :publisher

  def sign_out
    publisher_id = current_user.publisher_id
    @current_publisher = Publisher.find_by_id(publisher_id)
    @current_publisher.territory_id = @territory.id
    @current_publisher.save

    @territory.sign_out_date = DateTime.now
    @territory.save
  end

  def returned_date

  end

  def completed_date

  end

  def card_lost

  end

  def recorded_in_book?

  end
end
