
class UsersController < ApplicationController
  before_action :set_user , only:[:show,:edit]

  def show
    #binding.pry
  end 

  def edit
    if @user.fav_brand.blank?
      @fav_brands = nil
    else
     @fav_brands = @user.fav_brand.split(' ')
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user 
      flash[:notice] = 'ユーザー情報の編集をしました'
    else
      flash.now[:alert] = 'ユーザー情報を編集できませんでした'
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