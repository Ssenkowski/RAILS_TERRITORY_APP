class PublisherTerritoriesController < ApplicationRecord
  def create
    @publisher = Publisher.find_by_id(current_user.publisher_id)
    @bag = @publisher.bag_id

    publisher_territory = @bag.sign_out_territory(params[:territory][:territory_id])
    if publisher_territory.save
      @bag.save
      redirect_to publisher_path(@publisher)
    else
      redirect_to publisher_path(@publisher)
    end
  end
end
