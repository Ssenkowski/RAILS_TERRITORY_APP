class Publisher < ApplicationRecord
  belongs_to :congregation
  has_many :territories, through: :congregation
  has_many :house_to_house_record_ids, through: :territories
  has_many :do_not_call_ids, through: :territories

  def add_territory

  end

  def change_congregation

  end
end
