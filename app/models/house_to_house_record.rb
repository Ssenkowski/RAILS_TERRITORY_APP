class HouseToHouseRecord < ApplicationRecord
  belongs_to :publisher
  belongs_to :territory, through: :publisher

  def add_do_not_call

  end

  def add_note_symbol

  end

  def add_note

  end

  def add_todays_date
    Date.today.to_s(:long)
  end
end
