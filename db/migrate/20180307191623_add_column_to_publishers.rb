class AddColumnToPublishers < ActiveRecord::Migration[5.1]
  def change
    add_column :publishers, :bag_id, :integer
  end
end
