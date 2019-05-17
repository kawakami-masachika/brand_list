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

  def self.serach(name)
    return Shop.all unless name 
    Shop.tagged_with([name], :any => true)
  end  

end

