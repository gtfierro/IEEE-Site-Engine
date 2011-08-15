class SignupsController < ApplicationController
  
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
    @s.attended = true
    @s.save
    redirect_to event_path(@s.event), :notice => @u.email + "marked as attended"
    
  end
  
end