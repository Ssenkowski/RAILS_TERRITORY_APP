class Territory < ApplicationRecord
  belongs_to :congregation
  belongs_to :publisher

  def sign_out

  end

  def completed_date

  end

  def card_lost

  end
end
