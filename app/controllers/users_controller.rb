class UsersController < ApplicationController
  def new
    @user = User.new

  end
  
  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
#these are the same.
      #redirect_to user_path(@user)
      redirect_to @user
    else
      render 'new'
    end
  end
end
