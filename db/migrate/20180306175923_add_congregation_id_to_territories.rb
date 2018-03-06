class AddCongregationIdToTerritories < ActiveRecord::Migration[5.1]
  def change
    add_column :territories, :congregation_id, :integer
  end
end
