class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :shops, :reviews, :option]

  def show
    @shops = @user.shops
    @reviews = @user.reviews
  end

  def edit
    @fav_brands = if @user.fav_brand?
                    @user.fav_brand.split(' ')
                  else
                    []
                  end
  end

  def update
    @user.join_fav_brands(params[:user][:fav_brand_1], params[:user][:fav_brand_2], params[:user][:fav_brand_3])
    if @user.update(user_params)
      redirect_to @user, flash[:notice] = 'ユーザー情報の編集をしました'
    else
      flash.now[:alert] = 'ユーザー情報を編集できませんでした', render :edit
    end
  end

  def shops
    # @shops = Shop.where(user_id: @user.id).page(params[:page]).per(8)
    @shops = @user.shops.page(params[:page]).per(8)
  end

  def reviews
    # @reviews = Review.where(user_id: current_user.id).page(params[:page]).per(10)
    @reviews = @user.reviews.page(params[:page]).per(10)
  end

  def option
    redirect_to root_path unless @user == current_user
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :age, :sex, :fav_brand_1, :fav_brand_2, :fav_brand_3)
  end


end
