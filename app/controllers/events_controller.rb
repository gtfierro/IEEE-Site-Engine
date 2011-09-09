class EventsController < ApplicationController
  
  def new
    @e = Event.new
  end
  
  def create
    @e = Event.new(params[:event])
    if @e.save
      redirect_to home_url, :notice => "Event creation successful for " + @e.title
    else
      redirect_to home_url, :notice => @e.errors
    end
  end
  
  def edit
    @e = Event.find(params[:id])
  end
  
  def show
    if params[:id]=="all"
      @e = Event.all
      puts @e
      render "all"
    else
      @e = Event.find(params[:id])
    end
  end

  
  def signup
    @e = Event.find(params[:event_id])
    @e.users << current_user
    @e.save
    puts @e.users
    redirect_to home_url, :notice => "Signup for "+@e.title+" successful"
  end
  

  
  def update
    @e = Event.find(params[:id])
    if @e.update_attributes(params[:event])
      notice = "Update successful!"
    else
      notice = "Update was not successful"
    end
    redirect_to home_url, :notice => notice
  end
  
  def destroy
    @e = Event.find(params[:id])
    @e.destroy
    redirect_to home_url, :notice => "Event destroyed!"
  end

end