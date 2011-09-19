class EventsController < ApplicationController
  
  def new
    @e = Event.new
  end
  
  def create
    @e = Event.new(params[:event])
    respond_to do |format|
      if @e.save
        format.html {redirect_to home_url, :notice => "Event creation successful for" + @e.title}
        format.xml {head :ok}
      else
        format.html {redirect_to home_url, :notice => @e.errors}
        format.xml {render :sml => @e.errors, :status => :unprocessable_entity}
      end
    end
  end
  
  def edit
    @e = Event.find(params[:id])
  end
  
  def show
    respond_to do |format|
      if params[:id] == "all"
        @e = Event.all
        format.html {render "all"}
        format.xml {head :ok}
      else
        @e = Event.find(params[:id])
      end
    end
  end

  
  def signup
    @e = Event.find(params[:event_id])
    @e.users << current_user
    respond_to do |format|
      if @e.save
        format.html {redirect_to home_url, :notice => "Signup for "+ @e.title+ " successful"}
        format.xml {head :ok}
      else
        format.html {redirect_to home_url, :notice => "Signup was unsuccessful"}
        format.xml {render :xml => @e.errors, :status => :unprocessable_entity}
      end
    end
  end
  

  
  def update
    @e = Event.find(params[:id])
    respond_to do |format|
      if @e.update_attributes(params[:event])
        format.html {redirect_to home_url, :notice => "Update successful!"}
        format.xml {head :ok}
      else
        format.html {redirect_to home_url, :notice => "Update wasn't successful"}
        format.xml {render :xml => @e.errors, :status => :unprocessable_entity}
      end
    end
  end
  
  def destroy
    @e = Event.find(params[:id])
    @e.destroy
    respond_to do |format|
      format.html {redirect_to home_url, :notice => "Event destroyed!"}
      format.xml {head :ok}
    end
  end
end