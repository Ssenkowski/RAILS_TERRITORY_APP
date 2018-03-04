class HouseToHouseRecord < ApplicationRecord
  belongs_to :publisher
  belongs_to :territory, through: :publisher
end
