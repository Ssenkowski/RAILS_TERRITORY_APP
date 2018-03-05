class CreateHouseToHouseRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :house_to_house_records do |t|
      t.integer :territory_id
      t.integer :publisher_id
      t.integer :address
      t.string :street
      t.string :note_symbol
      t.boolean :do_not_call?, :default => false
      t.text :notes
      t.date :date

      t.timestamps
    end
  end
end
