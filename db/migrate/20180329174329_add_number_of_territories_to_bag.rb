class AddNumberOfTerritoriesToBag < ActiveRecord::Migration[5.1]
  def change
    add_column :bags, :number_of_territories, :integer
  end
end
