class TagsController < ApplicationController

  def index
    @brands = ActsAsTaggableOn::Tag.all.order(name: "ASC")
    @intial = 'a'..'z' 
    @num_intial = '0'..'9'
  end

  def show
    @brand = ActsAsTaggableOn::Tag.find(params[:id])
    @shops = Shop.tagged_with(@brand.name)
  end

  def destroy
    @brand = ActsAsTaggableOn::Tag.find(params[:id])
    @brand.destroy
    redirect_to action: 'index'
  end

end