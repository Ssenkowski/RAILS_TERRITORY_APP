class AddColumnToTerritories < ActiveRecord::Migration[5.1]
  def change
    add_column :territories, :signed_out, :string
  end
end
