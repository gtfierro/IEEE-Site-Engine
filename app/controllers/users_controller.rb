class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to "/login", :notice => "Signed up!"
    else
      redirect_to "/signup"
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html {redirect_to home_url, :notice => "User was successfully updated!"}
        format.xml { head :ok}
      else
        format.html { render :action => "edit"}
        format.xml { render :xml => @user.errors, :status => :unprocessable_entity}
      end
    end
  end
  
  def show
  end
  
  def home
    render "home"
  end
  
end