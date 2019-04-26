class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :shop_name
      t.string :address
      t.string :business_period
      t.string :staition
      t.string :tel
      t.string :shop_url
      t.string :shop_image
      t.text :shop_infomation
      t.integer :user_id

      t.timestamps
    end
  end
end
