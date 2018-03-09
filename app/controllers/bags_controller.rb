class BagsController < ApplicationRecord

  def create
    @bag = Bag.create(bag_params)
  end

  private

  def bag_params
    params.require(:bag).permit(:publisher_id, :territory_id)
  end
end
