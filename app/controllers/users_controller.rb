class UsersController < ApplicationController
  before_filter :has_permission, :except => [:home]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        format.html {redirect_to "/login", :notice => "Login successful"}
        format.xml {head :ok}
      else
        format.html {redirect_to "/signup"}
        format.xml {head :ok }
      end
    end
  end

  def edit
    @user = current_user
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
    @user = current_user
  end

end