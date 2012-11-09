class MessagesController < ApplicationController
  def index
    @mail_messages = MailMessage.where("received_id = ?",current_user.id).paginate(:page => params[:page], :per_page => 10)
    @mail_message = MailMessage.new
    respond_to do |format|
      format.html {render :layout => false}
      format.js {}
    end
  end

  def new
    @mail_message = MailMessage.new
    render :layout => false
  end

  def create
    @mail_message = MailMessage.new(params[:mail_message])
    respond_to do |format|
      if @mail_message.save
        format.html { redirect_to @mail_message, notice: 'Mail was send successfully.' }
        format.js {}
      else
       format.html { render action: "new" }
       format.js {}
      end
    end
  end

  def reply
    @mail_message = MailMessage.new(params[:mail_message])
    respond_to do |format|
      if @mail_message.save
        format.html { redirect_to @mail_message, notice: 'Mail was send successfully.' }
        format.js {}
      else
       format.html { render action: "new" }
       format.js {}
      end
    end
  end
end
