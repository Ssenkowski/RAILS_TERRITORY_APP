class PublisherTerritoriesController < ApplicationRecord
  def create
    @publisher = @User.find_by_id(current_user.id)
    if current_user.bag.nil?
      @bag = @publisher
  end
end
