class ShopsController < ApplicationController
  before_action :authenticate_user!,except:[:show,:index,:update]
  before_action :set_shop ,only:[:show, :edit,:update, :destroy]
  
  def index
    @shops = Shop.all
    
    
    # brands = []
    # #binding.pry
    # if params[:q].present?
    #   keywords = params[:q][:brand_name_eq].split(/[\p{blank}\s]+/)
    #   keywords.each { |value| brands.push(brand_name_eq: value)}  
    # end
    
    # @query = Shop.tagged_with([brands], :any => true)
    
    #@result_shops = @query.result(distinct: true)
  end

  def search 
    #binding.pry
    if params[:name].present?
      @brands = Shop.serach(params[:name].split(/[\p{blank}\s]+/))
    end 
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
      #@tags = ActsAsTaggableOn::Tag.where(name: 'sample1')
      #@tags = ActsAsTaggableOn::Tag.where("(name = ? ) OR (name = ? )",'sample1','sample2')
      #@tags =  ActsAsTaggableOn::Tag.where(name: @shop.tag_list)
      #下記に変更
      @brands =  ActsAsTaggableOn::Tag.where(name: @shop.brand_list)
    #  @review  = @shop.reviews.build(user_id: current_user.id) if current_user
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
    params.require(:shop).permit(:name,
                                :address,
                                :business_period,
                                :staition,:tel,
                                :url,
                                :images,
                                :information,
                                :brand_list,
                                )
  end

end









  