class UsersController < ApplicationController
  layout 'chapters'

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
    @user = @current_user
    @user_chapters = ChapterMember.get_chapters(@user.id) || []
    @is_primary_coord = ChapterMember.is_primary_coordinator?(@user.id)
    @is_secondary_coord = ChapterMember.is_primary_coordinator?(@user_id)
    @upcoming_event = Event.all
  end

  def uploader    
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    mime_type = MIME::Types.type_for(@user.avatar_file_name) 
    @user.update_attributes(:avatar_content_type => mime_type.first.content_type.to_s) if mime_type.first
    respond_to do |format|
      format.json { render json: @user.avatar.url(:medium)}
    end
  end
end
