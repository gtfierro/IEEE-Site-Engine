class SignupsController < ApplicationController
  
  def new
    @signup = Signup.new
    @e = Event.find(params[:event_id])
  end
  
  def create
    puts params
    @signup = Signup.new(params[:signup])
    @signup.user = current_user
    if @signup.save
      redirect_to home_url, :notice => "signup successful"
    else
      redirect_to home_url, :notice => @signup.errors
    end
  end
  
end