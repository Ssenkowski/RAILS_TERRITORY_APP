class Bag < ApplicationRecord
  has_many :publisher_territories
  has_many :territories, through: :publisher_territories
  belongs_to :publisher

  def sign_out_territory
    @publisher = Publisher.find_by_id(current_user.publisher_id)
    @territory = Territory.find_by_id(params[:id])
    @publisher.territory_id = @territory.id
  end

  def return_territory
    @publisher = Publisher.find_by_id(current_user.publisher_id)
    @publisher.territory_id.destroy #when a terrtiory is complete remove the territory from the users list of signed out territories
    @publisher.save
  end
end
