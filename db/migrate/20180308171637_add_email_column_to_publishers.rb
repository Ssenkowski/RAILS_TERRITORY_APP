class AddEmailColumnToPublishers < ActiveRecord::Migration[5.1]
  def change
    add_column :publishers, :email, :string
  end
end
