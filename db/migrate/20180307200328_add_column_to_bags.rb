class AddColumnToBags < ActiveRecord::Migration[5.1]
  def change
    add_column :bags, :territory_id, :integer
  end
end
