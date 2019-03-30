class User < ApplicationRecord
  attr_accessor :fav_brand_1 , :fav_brand_2 , :fav_brand_3

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  
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
  
  before_save :join_fav_brands
  private
  
  def join_fav_brands
    # self → いま操作しているユーザー情報
    # fav_brand_1~5 → ブランド名(ナイキ, アディダス) 
    if @fav_brand_1.blank? && @fav_brand_2.blank? && @fav_brand_3.blank? 
      self.fav_brand = nil
    #elsif @user.params[:destroy]
    else
      #self.fav_brand =  [@fav_brand_1 , @fav_brand_2, @fav_brand_3].join("")
      self.fav_brand = @fav_brand_1 + ' ' + @fav_brand_2 + ' ' + @fav_brand_3
    end
  end
  
end