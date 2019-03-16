class User < ApplicationRecord
  attr_accessor :fav_brand_1 , :fav_brand_2 , :fav_brand_3


  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  
  before_save :join_fav_brands , unless: :created_at
  
  private
  def join_fav_brands
  #binding.pry
    # self → いま操作しているユーザー情報
    # fav_brand_1~5 → ブランド名(ナイキ, アディダス)
    #self.fav_brand =  [self.fav_brand_1, self.fav_brand_2, self.fav_brand_3, self.fav_brand_4, self.fav_brand_5 ]
    self.fav_brand = self.fav_brand_1 + ' ' + self.fav_brand_2 + ' ' + self.fav_brand_3
  end
end