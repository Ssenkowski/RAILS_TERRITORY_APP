class DoNotCall < ApplicationRecord
  belongs_to :territory
  belongs_to :congregation, through: :territory
end
