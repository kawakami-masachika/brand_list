class RenameShopImageColumnToShops < ActiveRecord::Migration[5.2]
  def change
    rename_column :shops, :shop_image, :images
  end
end
