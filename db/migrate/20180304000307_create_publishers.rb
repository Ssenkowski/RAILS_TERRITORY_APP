class CreatePublishers < ActiveRecord::Migration[5.1]
  def change
    create_table :publishers do |t|
      t.string :username
      t.integer :territory_id
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
