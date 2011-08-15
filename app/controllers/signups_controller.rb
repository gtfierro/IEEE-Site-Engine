class SignupsController < ApplicationController
  
  before_filter :has_permission, :only => :mark
  
  def new
    @signup = Signup.new
    @e = Event.find(params[:event_id])
  end
  
  def create
    ##TODO
    # => update associations for users, events *and* signups
    puts params
    @e = Event.find(params[:signup][:event_id])
    @signup = Signup.new(params[:signup])
    @signup.user = current_user
    if @signup.save
      @e.signups << @signup
      @e.save
      redirect_to home_url, :notice => "signup successful"
    else
      redirect_to home_url, :notice => @signup.errors
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
    @s.save
    redirect_to event_path(@s.event), :notice => "Changed attended to "+@s.attended.to_s+" for "+@u.email
    
  end
  
end