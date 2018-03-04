class CreateTerritories < ActiveRecord::Migration[5.1]
  def change
    create_table :territories do |t|
      t.integer :number
      t.string :designation
      t.string :street_names
      t.date :sign_out
      t.string :publisher_name
      t.boolean :campaign_work?
      t.integer :house_to_house_record_id
      t.integer :do_not_call_id
      t.date :last_completed
      t.boolean :lost?

      t.timestamps
    end
  end
end
