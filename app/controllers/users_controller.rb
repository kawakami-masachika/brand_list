
class UsersController < ApplicationController
  #before_action :authenticate_user!, only: [:show]

  def show
    #binding.pry
    @user = User.find(params[:id])
  end

  
  
end