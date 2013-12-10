class SessionsController < ApplicationController
  
  def new

  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:email])
    sign_in user
#sign in the user and redirect to user's show page
    else
      flash.now[:error] = "Invalid email/password combination"
      render 'new'
      end
    
  end

  def destroy

  end

end
