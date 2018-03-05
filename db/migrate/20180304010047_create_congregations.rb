class CreateCongregations < ActiveRecord::Migration[5.1]
  def change
    create_table :congregations do |t|
      t.string :name
      t.integer :number
      t.integer :address
      t.string :street
      t.datetime :meeting_times
      t.datetime :saturday_field_service_start_time
      t.boolean :saturday_meet_at_the_hall?
      t.boolean :wednesday_evening_service_meeting?
      t.datetime :wednesday_evening_service_meeting_date_time
      t.string :scheduled_public_talk_title
      t.datetime :special_talk_date_time
      t.string :special_talk_title
      t.datetime :memorial_date_time
      t.datetime :regional_convention_date_time
      t.string :regional_convention_theme
      t.datetime :co_visit_start_date
      t.datetime :co_visit_end_date
      t.string :thirty_hour_aux_months
      t.integer :publisher_id
      t.integer :territory_id

      t.timestamps
    end
  end
end
