class Publisher < ApplicationRecord
  belongs_to :congregation
  has_one :bag
  has_many :territories, through: :bag

  validates_presence_of :first_name, :message => "can't be empty"
  validates_presence_of :last_name, :message => "can't be empty"
  validates_presence_of :username, :message => "can't be empty"
  validates_presence_of :email, :message => "can't be empty"
  validates_uniqueness_of :email, :message => "This email is already in use"


# Additional admin features
#  def change_congregation
#    @publisher = Publisher.find_by_id(current_user.publisher_id)
#    @publisher.congregation_id = params([:congregation_id])
#    @publisher.save
#  end
#
#  def change_last_name
#    @publisher = Publisher.find_by_id(current_user.publisher_id)
#    @publisher.last_name = params([:last_name])
#    @publisher.save
#  end

#  def change_service_group
#    @publisher = Publisher.find_by_id(current_user.publisher_id)
#    @publisher.service_group = params([:service_group])
#    @publisher.save
#  end
end
