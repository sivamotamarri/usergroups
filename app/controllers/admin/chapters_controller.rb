class Admin::ChaptersController < ApplicationController
  layout 'admin'

  def index
    @chapters = Chapter.applied_chapters    
    respond_to do |format|
      format.html # index.html.erb
      format.js{ render layout: false }
    end
  end  

  def incubate
   @chapters = Chapter.incubated_chapters
   render :layout => false
  end

  def active
    @chapters = Chapter.active_chapters
    render :layout => false
  end

  def delist
    @chapters = Chapter.delist_chapters
    render :layout => false
  end

  def change_status
    chapter = Chapter.find(params[:id])
    msg = ""
    case params[:status]
    when "incubate"
      chapter.incubate
      msg = "Approved on 3 /10 / 2012"
    when "active"
      chapter.active
      msg = "#{chapter.chapter_status}"
    when "delist_to_incubate"
      chapter.delist_to_incubate
      msg = "#{chapter.chapter_status}"
    when "delist"
      chapter.delist
      msg = "#{chapter.chapter_status}"
    when "active_to_incubate"
      chapter.active_to_incubate
      msg = "#{chapter.chapter_status}"
    else
      chapter.deny
      msg = "#{chapter.chapter_status}"
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json{ render json: {:msg => msg} , status:  :ok }
    end
  end
end
