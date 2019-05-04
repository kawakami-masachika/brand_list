class ReviewsController < ApplicationController
  #before_action :set_review ,only:[:show, :edit, :update, :destroy]

  def index
    @shop = Shop.find(params[:shop_id])
    @reviews = Review.page(params[:page]).per(10)
  end

  def new 
    @shop = Shop.find(params[:shop_id])
    @review = Review.new
    #@review.user_id = current_user.id
    #binding.pry
  end

  def create
    @shop = Shop.find(params[:shop_id])
    @review = Review.new(review_params)
    if @review.save
      
    # @review = @shop.reviews.new
    # @review.attributes = review_params
    # @review.user_id = current_user.id
    # @review.save!
      redirect_to current_user
    else 
      render :new
    end
  end
  
  def edit
    @shop = Shop.find(params[:shop_id])
    @review = Review.find(params[:id])
    
  end

  def update
    @shop = Shop.find(params[:shop_id])
    @review = Review.find(params[:id])
   if @review.update(review_params)
      redirect_to @shop
      flash[:norice] = "レビューを編集しました"
    else
      render :edit
      flash[:alert] = "レビューの編集に失敗しました"
    end
  end

  def show
    @shop = Shop.find(params[:shop_id])
    @review = Review.find(params[:id])
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to @shop
  end

  private 
  def review_params
    params.require(:review).permit(:title,:comment).merge(shop_id: params[:shop_id],user_id: current_user.id)
  end

  def set_review
    
  end

end
