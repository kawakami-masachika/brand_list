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
  validates :name, presence: true, uniqueness: true , length: { maximum: 30 }
  validates :address, length: {maximum: 60}
  validates :business_period , presence: true
  validates :staition , presence: true, length: { maximum: 15 }
  validates :information, length: { minimum: 20 } , length: { maximum: 150 } 

  # ショップの検索
  def self.serach(name)
    return Shop.all unless name
    Shop.tagged_with([name], :any => true)
  end

end
