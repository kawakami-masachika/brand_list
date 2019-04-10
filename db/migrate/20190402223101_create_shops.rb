class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :address
      t.string :business_period
      t.string :staition
      t.string :tel
      t.string :url
      t.string :images
      t.text :shop_infomation
      t.integer :user_id

      t.timestamps
    end
  end
end
