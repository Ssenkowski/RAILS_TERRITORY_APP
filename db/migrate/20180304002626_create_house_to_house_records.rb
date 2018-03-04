class CreateHouseToHouseRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :house_to_house_records do |t|
      t.integer :address
      t.string :streetname
      t.string :follow_up?
      t.text :notes

      t.timestamps
    end
  end
end
