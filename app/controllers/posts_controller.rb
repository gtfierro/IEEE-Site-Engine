class PostsController < ApplicationController
  
  def new
    @p = Post.new
  end
  
  def create
    @p = Post.new(params[:post])
    if @p.save
      redirect_to home_url, :notice => "Post creation successful for " + @p.title
    else
      redirect_to home_url, :notice => @p.errors
    end
  end
  
  def edit
    @p = Post.find(params[:id])
  end
  
  def update
    @p = Post.find(params[:id])
    if @p.update_attributes(params[:post])
      notice = "Update successful!"
    else
      notice = "Update was not successful"
    end
    redirect_to home_url, :notice => notice
  end
  
  def destroy
    @p = Post.find(params[:id])
    @p.destroy
    redirect_to home_url, :notice => "Post destroyed!"
  end

end