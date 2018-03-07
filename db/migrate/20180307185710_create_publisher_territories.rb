class CreatePublisherTerritories < ActiveRecord::Migration[5.1]
  def change
    create_table :publisher_territories do |t|
      t.integer :publisher_id
      t.integer :territory_id

      t.timestamps
    end
  end
end
