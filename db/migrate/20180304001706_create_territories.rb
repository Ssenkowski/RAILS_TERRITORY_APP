class CreateTerritories < ActiveRecord::Migration[5.1]
  def change
    create_table :territories do |t|
      t.integer :number
      t.string :designation
      t.string :street_names
      t.date :sign_out_date
      t.integer :publisher_id
      t.boolean :campaign_work?
      t.integer :house_to_house_record_id
      t.integer :do_not_calls_id
      t.date :completed_date
      t.boolean :card_lost?

      t.timestamps
    end
  end
end
