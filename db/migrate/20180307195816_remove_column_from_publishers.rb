class RemoveColumnFromPublishers < ActiveRecord::Migration[5.1]
  def change
    remove_column :publishers, :territory_id, :integer
  end
end
