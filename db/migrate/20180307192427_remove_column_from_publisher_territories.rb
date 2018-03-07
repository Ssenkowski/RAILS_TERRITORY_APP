class RemoveColumnFromPublisherTerritories < ActiveRecord::Migration[5.1]
  def change
    remove_column :publisher_territories, :publisher_id, :integer
  end
end
