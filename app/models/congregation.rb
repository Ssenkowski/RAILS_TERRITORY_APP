class Congregation < ApplicationRecord
  has_many :territories
  has_many :publishers

  validates_presence_of :name, :message => "can't be empty"
  validates_presence_of :number, :message => "can't be empty"
  validates_presence_of :address, :message => "can't be empty"
  validates_presence_of :street, :message => "can't be empty"

end
