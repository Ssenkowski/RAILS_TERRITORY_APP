class AddColumnToPublisherTerritories < ActiveRecord::Migration[5.1]
  def change
    add_column :publisher_territories, :bag_id, :integer
  end
end
