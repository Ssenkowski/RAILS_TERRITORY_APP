class CreateCongregations < ActiveRecord::Migration[5.1]
  def change
    create_table :congregations do |t|
      t.string :name
      t.integer :address
      t.string :street
      t.integer :number
      t.datetime :meeting_times
      t.string :scheduled_public_talk_title
      t.datetime :special_talk_date_time
      t.datetime :memorial_date_time
      t.datetime :CO_visit_start_date
      t.datetime :CO_visit_end_date
      t.string :thirty_hour_aux_months

      t.timestamps
    end
  end
end
