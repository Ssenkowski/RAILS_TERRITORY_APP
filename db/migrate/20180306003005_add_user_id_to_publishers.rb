class AddUserIdToPublishers < ActiveRecord::Migration[5.1]
  def change
    add_column :publishers, :user_id, :integer
  end
end
