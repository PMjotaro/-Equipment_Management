class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.authenticate(params[:name], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Signed in!"
    else
      flash.now.alert = "Invalid name or password"
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice =>"Signed out!"
  end
  
end
