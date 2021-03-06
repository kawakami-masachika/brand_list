class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index, :update]
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @shop = Shop.find(params[:shop_id])
    @brands = ActsAsTaggableOn::Tag.where(name: @shop.brand_list)
    @reviews = Review.where(shop_id: @shop.id).page(params[:page]).per(5)
  end

  def new
    @shop = Shop.find(params[:shop_id])
    @review = Review.new
  end

  def create
    @shop = Shop.find(params[:shop_id])
    @review = Review.new(review_params)
    if @review.save
      redirect_to @shop
      flash[:notice] = 'レビューを投稿しました'
    else
      render :new
    end
  end

  def edit
    if @review.user_id == current_user.id
      @shop = Shop.find(params[:shop_id])
    else 
      redirect_to root_path
      flash[:alert] = '権限がありません'
    end
  end

  def update
    @shop = @review.shop
    if @review.update(review_params)
      redirect_to @shop
      flash[:notice] =  'レビューを編集しました'
    else
      render :edit
      flash[:alert] = 'レビューの編集に失敗しました'
    end
  end

  def show
    @shop = Shop.find(params[:shop_id])
    @brands = ActsAsTaggableOn::Tag.where(name: @shop.brand_list)
  end

  def destroy
    @shop = @review.shop
    @review.destroy
    redirect_to @shop
    flash[:notice] = 'レビューを削除しました'
  end

  private

  def review_params
    # 書き方変更したほうがいいかも
    params.require(:review).permit(:title, :comment).merge(shop_id: params[:shop_id], user_id: current_user.id)
  end

  def set_review
    @review = Review.find(params[:id])
  end

end