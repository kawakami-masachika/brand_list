class RenameShopUrlColumnToShops < ActiveRecord::Migration[5.2]
  def change
    rename_column :shops, :shop_url, :url
  end
end
