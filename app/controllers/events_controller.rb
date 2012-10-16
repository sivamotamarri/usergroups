require 'eventbrite-client'
require 'oauth2'
class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  before_filter :initialise_eventbrite_client
  def index
    @events = Event.all
    render :layout => false
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new
    respond_to do |format|      
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  def oauth_reader
    if !params[:code].blank?
      access_token_obj = @auth_client_obj.auth_code.get_token(params[:code], { :redirect_uri => EVENTBRITE_REDIRECT_URL, :token_method => :post })      
      eventbrite_entry = EventbriteOauthToken.new(:user_id => @current_user.id, :event_brite_token => access_token_obj.token)
      eventbrite_entry.save!
      @eb_client = EventbriteClient.new({ access_token: access_token_obj.token})
    end    
    respond_to do |format|      
      format.html {redirect_to new_event_path}# new.html.erb
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])


    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

  def initialise_eventbrite_client 
  	event_brite_oauthtoken = EventbriteOauthToken.find_by_user_id(@current_user.id)
  	if(!event_brite_oauthtoken.nil?) 	
  	 @eb_client = EventbriteClient.new({ access_token: event_brite_oauthtoken.event_brite_token})
  	else
  	 @auth_client_obj = OAuth2::Client.new(EVENTBRITE_CLIENT_ID, EVENTBRITE_CLIENT_SECRET, {:site => EVENTBRITE_URL})
  	 @accept_url = @auth_client_obj.auth_code.authorize_url( :redirect_uri => EVENTBRITE_REDIRECT_URL)
  	end	
  end
end
