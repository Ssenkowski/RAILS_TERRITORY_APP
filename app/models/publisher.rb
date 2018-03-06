class Publisher < ApplicationRecord
  belongs_to :congregation
  has_many :territories, through: :congregation
  has_many :house_to_house_record_ids, through: :territories
  has_many :do_not_call_ids, through: :territories

  def add_territory
    @publisher = Publisher.find_by_id(current_user.publisher_id)
    @territory = Territory.find_by_id(params[:id])
    @publisher.territory_id = @territory.id
  end

  def remove_territory
    @publisher = Publisher.find_by_id(current_user.publisher_id)
    @publisher.territory_id.destroy #when a terrtiory is complete remove the territory from the users list of signed out territories
    @publisher.save
  end

  def change_congregation
    @publisher = Publisher.find_by_id(current_user.publisher_id)
    @publisher.congregation_id = params([:congregation_id])
    @publisher.save
  end

  def change_last_name
    @publisher = Publisher.find_by_id(current_user.publisher_id)
    @publisher.last_name = params([:last_name])
    @publisher.save
  end

  def change_service_group
    @publisher = Publisher.find_by_id(current_user.publisher_id)
    @publisher.service_group = params([:service_group])
    @publisher.save
  end
end
