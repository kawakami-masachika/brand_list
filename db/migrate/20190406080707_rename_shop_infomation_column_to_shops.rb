class RenameShopInfomationColumnToShops < ActiveRecord::Migration[5.2]
  def change
    rename_column :shops, :shop_infomation, :information
  end
end
