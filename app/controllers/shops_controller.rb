class ShopsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index, :update]
  before_action :set_shop, only:[:show, :edit, :update, :destroy]

  def index
    @shops = Shop.all
  end

  def search
    @brands = Shop.serach(params[:name].split(/[\p{blank}\s]+/)) if params[:name].present?
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.user_id = current_user.id
    if @shop.save
      redirect_to action: 'index'
      flash[:notice] = "ショップ情報を投稿しました"
    else
      render :new
      binding.pry
    end
  end

  def edit
  end

  def update
    if @shop.update(shop_params)
      redirect_to action: 'show' 
      flash[:norice] = "ショップ情報を編集しました"
    else
      render :edit
      flash[:alert] = "ショップ情報の編集に失敗しました"
    end
  end

  def show
    @shop = Shop.includes(:user).find(params[:id])
    @reviews = @shop.reviews.includes(:user).all.limit(3)
    @brands = ActsAsTaggableOn::Tag.where(name: @shop.brand_list)
  end

  def destroy
    @shop.destroy
    redirect_to current_user
    flash[:norice] = "ショップを削除しました"
  end

  private

  def set_shop
    @shop = Shop.find(params[:id])
  end

  def shop_params
    params.require(:shop).permit(:name, :address, :business_period, :staition, :tel, :url, :images, :information, :brand_list)
  end

end
