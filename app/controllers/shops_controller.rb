class ShopsController < ApplicationController
  before_action :authenticate_user!,except:[:show,:index,:update]
  before_action :set_shop ,only:[:show,:edit,:update, :destroy]
  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.user_id = current_user.id
    if @shop.save
      redirect_to current_user
      flash[:notice] = "ショップ情報を投稿しました"
    else
      render :new
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
  end

  def destroy
    @shop.destroy
    redirect_to current_user
  end

  private
  def set_shop
    @shop = Shop.find(params[:id])
  end

  def shop_params
    params.require(:shop).permit(:name,:address,:business_period,:staition,:tel,:url,:images,:information)
  end

end
