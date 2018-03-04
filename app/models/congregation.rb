class Congregation < ApplicationRecord
  has_many :territories
  has_many :publishers
  has_many :do_not_call_ids, through: :territories
end
