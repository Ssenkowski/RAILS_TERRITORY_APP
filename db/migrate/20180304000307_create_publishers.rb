class CreatePublishers < ActiveRecord::Migration[5.1]
  def change
    create_table :publishers do |t|
      t.string :username
      t.integer :congregation_id
      t.integer :territory_id
      t.string :first_name
      t.string :last_name
      t.integer :service_group
      t.datetime :your_saturday_field_service_group_start_time

      t.timestamps
    end
  end
end
