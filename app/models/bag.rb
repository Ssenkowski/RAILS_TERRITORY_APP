class Bag < ApplicationRecord
  has_many :publisher_territories
  has_many :territories, through: :publisher_territories
  belongs_to :publisher

  def sign_out_territory(territory_id)
    @current_territory = self.publisher_territories.find_by_id(territory_id)
      if @current_territory == nil || ""
        @current_territory = self.publisher_territories.build(territory_id: territory_id)
      end
    self.territory_id = @current_territory.id
    @territory = Territory.find_by_id(territory_id)
    @territory.signed_out = "true"
    @territory.bag_id = self.id
    @territory.sign_out_date = DateTime.now.strftime("%B %d, %Y")
    @territory.save
    self.save
  end

  def return_territory
    @publisher = Publisher.find_by_id(current_user.publisher_id)
    @publisher.territory_id.destroy #when a terrtiory is complete remove the territory from the users list of signed out territories
    @publisher.save
  end
end
