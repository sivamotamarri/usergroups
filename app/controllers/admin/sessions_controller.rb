class Admin::SessionsController < ApplicationController

  def new
    reset_session
  end

  def create
    user = User.find(:first, :conditions => ["email = ?", params[:email]])
    if !user.nil?
      status = user.valid_password?(params[:password]) unless user.nil?
      if status && user.admin?
        session[:user_id] = user.id
        redirect_to admin_chapters_url, :notice => "Logged in!"
      else
       flash.now.alert = "Invalid email or password"
       render "new"
      end
    else
       flash.now.alert = "Invalid email or password"
       render "new"
    end      
  end

  def destroy
    reset_session
    redirect_to new_admin_session_url, :notice => "Logged out!"
  end
  
end
