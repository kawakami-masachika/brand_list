class User < ApplicationRecord
  attr_accessor :fav_brand_1 , :fav_brand_2 , :fav_brand_3

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :shops#, through: :review
  has_many :reviews, through: :shops#, through: :shops
  #has_many :review_shops, through: :reviews, source: :shop
  
  validates :name, 
    presence: true,
    length: {maximum: 20}

  validates :age,
    presence: true,
    :numericality => { :greater_than => 0 } 

  validates :sex,
    presence: true

  with_options length: {maximum: 30} do
    validates :fav_brand_1
    validates :fav_brand_2
    validates :fav_brand_3
  end
  
  #before_create :join_fav_brands
  # before_update :join_fav_brands



  def join_fav_brands(fav_brand_1,fav_brand_2,fav_brand_3)
    # self → いま操作しているユーザー情報
    # fav_brand_1~5 → ブランド名(ナイキ, アディダス) 
    if fav_brand_1.blank? && fav_brand_2.blank? && fav_brand_3.blank? 
      self.fav_brand = nil
    else
      self.fav_brand = fav_brand_1 + ' ' + fav_brand_2 + ' ' + fav_brand_3
    end
    self.save
  end
  
end