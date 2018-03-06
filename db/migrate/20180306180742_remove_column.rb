class RemoveColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :territories, :publisher_id, :integer
    remove_column :territories, :campaign_work?, :boolean
    remove_column :territories, :house_to_house_record_id, :integer
    remove_column :territories, :do_not_calls_id, :integer

  end
end
