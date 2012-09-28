class ApplicationController < ActionController::Base
  protect_from_forgery
  include Userstamp

  def current_user
    @user = User.find(1)
  end

end
