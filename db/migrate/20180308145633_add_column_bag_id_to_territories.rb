class AddColumnBagIdToTerritories < ActiveRecord::Migration[5.1]
  def change
    add_column :territories, :bag_id, :integer
  end
end
