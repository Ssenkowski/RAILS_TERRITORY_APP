class CreateDoNotCalls < ActiveRecord::Migration[5.1]
  def change
    create_table :do_not_calls do |t|
      t.integer :territory_id
      t.integer :address
      t.string :street
      t.date :date
      t.text :note

      t.timestamps
    end
  end
end
