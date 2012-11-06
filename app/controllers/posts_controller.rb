class PostsController < ApplicationController
	def index
		render :layout => false
	end

	def chapterposts
    chapter_id = params[:chapter_id]
    #user_events = EventMember.find_all_by_user_id(@current_user.id, :include => ['event'], :conditions => "events.chapter_id = #{chapter_id}") || []
    @posts = Post.find_by_chapter_id(chapter_id)
    
     respond_to do |format|      
      if !params["page"].blank?
         format.js
      else
        format.js {render :partial => 'posts_list' }# new.html.erb
      end
    end
 
  end

  def new
    @post = Post.new    
    respond_to do |format|      
      format.js {render :partial => 'form'} # new.html.erb
      format.json { render json: @event }
    end
  end

end
