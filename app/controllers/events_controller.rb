class EventsController < ApplicationController
  before_filter :has_permission, :except => [:show, :calendar, :index]
    
  def index
    @e = Event.order("event_start desc")
    @user = current_user
  end
  
  def new
    @e = Event.new
  end
  
  def create
    @e = Event.new(params[:event])
    @e.author_id = current_user.id
    respond_to do |format|
      if @e.save
        msg = "Event creation successful for #{@e.title}"
        unless @e.add_to_google_calendar
          msg = "Warning: #{@e.title} may not have been added correctly to Google Calendar" 
        end
        format.html {redirect_to events_path, :notice => msg}
        format.xml {head :ok}
      else
        error_message = "Errors with Event Creation: "
        @e.errors.values.each {|value| value.each {|msg| error_message << "#{msg}, "} }
        error_message.chop!.chop!
        format.html {redirect_to events_path, :notice => error_message}
        format.xml {render :sml => @e.errors, :status => :unprocessable_entity}
      end
    end
  end
  
  def edit
    if not Event.exists?(params[:id])
      respond_to do |format|
        format.html {redirect_to events_path, :notice => "Event not found"}
        format.xml {head :ok}      
      end
    else
      @e = Event.find(params[:id])
    end
  end
  
  def show
    if not Event.exists?(params[:id])
      respond_to do |format|
        format.html {redirect_to events_path, :notice => "Event not found"}
        format.xml {head :ok}      
      end
    else
      @e = Event.find(params[:id])
    end
  end

  
  def signup
    if not Event.exists?(params[:id])
      respond_to do |format|
        format.html {redirect_to events_path, :notice => "Event not found"}
        format.xml {head :ok}      
      end
    else
      @e = Event.find(params[:id])
    end
    @e.users << current_user
    respond_to do |format|
      if @e.save
        format.html {redirect_to event_path(@e), :notice => "Signup for "+ @e.title+ " successful"}
        format.xml {head :ok}
      else
        format.html {redirect_to events_path, :notice => "Signup was unsuccessful"}
        format.xml {render :xml => @e.errors, :status => :unprocessable_entity}
      end
    end
  end
  
  def update
    if not Event.exists?(params[:id])
      respond_to do |format|
        format.html {redirect_to events_path, :notice => "Event not found"}
        format.xml {head :ok}      
      end
    else
      @e = Event.find(params[:id])
    end
    respond_to do |format|
      if @e.update_attributes(params[:event])
        format.html {redirect_to event_path, :notice => "Update successful!"}
        format.xml {head :ok}
      else
        format.html {redirect_to event_path, :notice => "Update wasn't successful"}
        format.xml {render :xml => @e.errors, :status => :unprocessable_entity}
      end
    end
  end
  
  def destroy
    @e = Event.find(params[:id])
    @e.destroy
    respond_to do |format|
      format.html {redirect_to events_path, :notice => "Event destroyed!"}
      format.xml {head :ok}
    end
  end
    
  def calendar
  end
    
end
