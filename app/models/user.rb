class User < ApplicationRecord
  attr_accessor :fav_brand_1 , :fav_brand_2 , :fav_brand_3
  

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  
  before_save :join_fav_brands
  #binding.pry
  #before_update :join_fav_brands
  
  
  private
  def join_fav_brands 
    # self → いま操作しているユーザー情報
    # fav_brand_1~5 → ブランド名(ナイキ, アディダス) 
    if @fav_brand_1.blank? && @fav_brand_2.blank? && @fav_brand_3.blank?
      fav_brand
    else
      #self.fav_brand =  [@fav_brand_1 , @fav_brand_2, @fav_brand_3].join("")
      self.fav_brand = @fav_brand_1 + ' ' + @fav_brand_2 + ' ' + @fav_brand_3
    end
  end

end