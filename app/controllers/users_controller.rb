class UsersController < ApplicationController

 
  
  def edit
    @user = User.find_by_email(params[:email])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    session[:user_id] = @user.id
    session[:user] = {:email => @user.email, :verified => true, :name => @user.fullname}
    redirect_to profile_url
  end


  def profile
  end
end
