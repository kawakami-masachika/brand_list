class RenameShopNameToNameShops < ActiveRecord::Migration[5.2]
  def change
    rename_column :shops, :shop_name, :name
  end
end
