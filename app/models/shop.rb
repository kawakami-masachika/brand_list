class Shop < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  #acts_as_taggable
  #下記に変更
  acts_as_taggable_on :brand
  scope :by_join_date , -> {order(created_at: :DESC)}

  #レビューをしたユーザーを取得したい場合 :revoew_users(任意) through XX でテーブルを経由, sourceで何を持って来るか(単数形)
  #has_many :review_users, through: :reviews, source: :user
  mount_uploader :images, ImagesUploader

  #バリデーション
  validates :name , presence: true , uniqueness: true , length: { maximum: 30 }
  validates :address , length: {maximum: 60}
  validates :business_period , presence: true
  validates :staition , presence: true , length: { maximum: 15 }
  validates :information , presence: true , length: { minimum: 20 } , length: { maximum: 150 } 
  validates :brand_list , presence: true

  # ショップの検索
  def self.search(brand_names)
    shops = Shop.all
    treat_shops = []
    brand_names.each do |brand|
      shops.each do |shop|
        shop.brand_list.each do |brands|
        #binding.pry
          if brands.match?(/#{brand}/)  
            treat_shops.push(shop)
          end
        end
      end
    end
    return treat_shops.
    
    
  end

end
