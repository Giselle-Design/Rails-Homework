class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email params[:email]
    if user&.authenticate params[:password]
      session[:user_id] = user.id
      redirect_to posts_path notice: "Sign In!"
    else
      flash[:alert] = "Wrong email or Password"
      render :new
    end
  end



  def destroy
    session[:user_id] = nil
    redirect_to posts_path notice: "Sign Out!"
  end



end
