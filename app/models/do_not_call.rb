class DoNotCall < ApplicationRecord
  belongs_to :territory
  belongs_to :congregation, through: :territory

  def add_note

  end

  def add_todays_date
    Date.today.to_s(:long)
  end
end
