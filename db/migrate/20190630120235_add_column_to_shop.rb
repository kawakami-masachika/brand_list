class AddColumnToShop < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :taste, :integer, null: false, default: 0, limit: 1
  end
end
