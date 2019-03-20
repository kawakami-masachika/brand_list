
class UsersController < ApplicationController
  #before_action :authenticate_user!, only: [:show]
  before_action :set_user , only:[:show,:edit]

  def show
    #binding.pry
  end 

  def edit
  end

   def update
    
    @user = User.find(params[:id])
    if @user.update(user_params)
      #binding.pry
      redirect_to @user
    else
      render :edit
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :age, :sex, :fav_brand_1, :fav_brand_2, :fav_brand_3)
  end
  

end