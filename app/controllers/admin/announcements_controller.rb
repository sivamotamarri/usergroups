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
      if @anouncement.save
        format.html { redirect_to @announcement, notice: 'Anouncement was successfully created.' }
        format.json { render json: @announcement, status: :created, location: @anouncement }
      else
        format.html { render action: "new" }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
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
