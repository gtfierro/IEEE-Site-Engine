class SignupsController < ApplicationController
  
  before_filter :has_permission
  
  def new
    @signup = Signup.new
    @e = Event.find(params[:event_id])
  end
  
  def create
    ##TODO
    # => update associations for users, events *and* signups
    @e = Event.find(params[:signup][:event_id])
    @signup = Signup.new(params[:signup])
    @signup.user = current_user
    respond_to do |format|
      if @signup.save
        @e.signups << @signup
        if @e.save
          format.html {redirect_to home_url, :notice => "Signup successful"}
          format.xml {head :ok}
        else
          format.html{redirect_to home_url, :notice => "Signup wasn't successful"}
          format.xml {render :xml => @e.errors, :status => :unprocessable_entity}
        end
      else
        format.html {redirect_to home_url, :notice => "Signup wasn't successful"}
        format.xml {render :xml => @signup.errors, :status => :unprocessable_entity}        
      end
    end
  end
  
  def mark
    @u = User.find(params[:user_id])
    @s = Signup.find(params[:signup_id])
    if @s.attended == true
      @s.attended = false
    else
      @s.attended = true
    end
    respond_to do |format|
      if @s.save
        format.html {redirect_to event_path(@s.event), :notice => "Changed attended to "+@s.attended.to_s+" for "+@u.email}
        format.xml {head :ok}
      else
        format.html {redirect_to event_path(@s.event), :notice => "Change was unsuccessful"}
        format.xml {render :xml => @s.errors, :status => :unprocessable_entity}
      end
    end
  end
  
end