class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      flash.delete(:warning)
      redirect_to posts_path
    else
      flash[:notice] = "Unable to create user"
      render :new
    end
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update user_params
      flash[:notice] = "Account Was Updated Successfully."
      redirect_to user_path
    else
      render :edit
    end
  end

  def show
  end

  def edit_password
    @user = User.find(params[:user_id])
  end


  def update_password
    @user = User.find(params[:user_id])
    if @user.update user_params
      flash[:notice] = 'Password Was Changed Successfully.'
        redirect_to user_path
      else
        flash[:notice] = "Try Again"
       render :edit_password
     end
  end


  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  # def user_params_one
  #   params.require(:user).permit(:password, :new_password, :password_confirmation)
  # end

end
