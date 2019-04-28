class Shop < ApplicationRecord
  belongs_to :user
  has_many :reviews
  #acts_as_taggable
  #下記に変更
  acts_as_taggable_on :brand 

  #レビューをしたユーザーを取得したい場合 :revoew_users(任意) through XX でテーブルを経由, sourceで何を持って来るか(単数形)
  #has_many :review_users, through: :reviews, source: :user
  mount_uploader :images, ImagesUploader
end

