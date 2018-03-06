class Territory < ApplicationRecord
  belongs_to :congregation
  belongs_to :publisher, through: :congregation
  has_many :do_not_calls
  has_one :house_to_house_record #This should be cleared every time a publisher turns the territory back in

  def add_house_to_house_record

  end

  def add_do_not_call

  end

  def sign_out

  end

  def completed_date

  end

  def campaign_work

  end

  def card_lost

  end
end
