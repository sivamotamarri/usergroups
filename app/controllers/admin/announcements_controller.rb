class Admin::AnnouncementsController < ApplicationController
  layout 'admin'
  def index
   render :layout => false
  end

  def new
   @announcement = Announcement.new
   render :layout => false
  end

  def create
    @announcement = Announcement.new(params[:announcement])
    respond_to do |format|
      if @announcement.save
        format.html { redirect_to @announcement, notice: 'Announcement was successfully created.' }
        format.js {}
      else
       format.html { render action: "new" }
       format.js {}
      end
    end
  end
  
  def announcement_history
    @announcements = Announcement.paginate(:page => params[:page], :per_page => 1)
    respond_to do |format|
      format.html { render :layout => false }
      format.js {}
    end
  end
end
