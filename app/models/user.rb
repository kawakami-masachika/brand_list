class User < ApplicationRecord
  attr_accessor :fav_brand_1 , :fav_brand_2 , :fav_brand_3

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :shops#, through: :review
  has_many :reviews#, through: :shops#, through: :shops
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

  def join_fav_brands(fav_brand_1, fav_brand_2, fav_brand_3)
    self.fav_brand = if fav_brand_1.blank? && fav_brand_2.blank? && fav_brand_3.blank?
                       nil
                     else
                       fav_brand_1 + ' ' + fav_brand_2 + ' ' + fav_brand_3
                     end
  end

end
