class ReviewsController < ApplicationController
  def new 
    @shop = Shop.find(params[:shop_id])
    @review = Review.new
    #@review.user_id = current_user.id
    #binding.pry
  end

  def create
    Review.create(review_params)
    # @review = @shop.reviews.new
    # @review.attributes = review_params
    # @review.user_id = current_user.id
    # @review.save!
    binding.pry
    redirect_to current_user
  end


  private 
  def review_params
    params.require(:review).permit(:title,:comment).merge(shop_id: params[:shop_id],user_id: current_user.id)
  end

end
