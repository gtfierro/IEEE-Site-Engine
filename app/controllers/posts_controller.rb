class PostsController < ApplicationController
  before_filter :has_permission, :except => :show
  
  def new
    @p = Post.new
  end
  
  def create
   params[:post][:content] = Sanitize.clean(params[:post][:content], Sanitize::Config::RELAXED)
    @p = Post.new(params[:post])
    @p.author_id = current_user.id
    respond_to do |format|
      if @p.save
        format.html {redirect_to home_url, :notice => "Post creation successful for " + @p.title }
        format.xml {head :ok}
      else
        format.html {redirect_to home_url, :notice => @p.errors}
        format.xml {render :xml => @p.errors, :status => :unprocessable_entity}
      end
    end
  end
  
  def edit
    if not Post.exists?(params[:id])
      redirect_to home_url, :notice => "Post not found"
    else
      @p = Post.find(params[:id])
    end
  end
  
  def update
    params[:post][:content] = Sanitize.clean(params[:post][:content], Sanitize::Config::RELAXED)
    if not Post.exists?(params[:id])
      redirect_to home_url, :notice => "Post not found"
    else
      @p = Post.find(params[:id])
    end
    respond_to do |format|
      if @p.update_attributes(params[:post])
        format.html {redirect_to home_url, :notice => "Update successful!"}
        format.xml {head :ok}
      else
        format.html {redirect_to home_url, :notice => "Update failed!"}
        format.xml {render :xml => @p.errors, :status => :unprocessable_entity}
      end
    end
  end
  
  def destroy
    if not Post.exists?(params[:id])
      redirect_to home_url, :notice => "Post not found"
    else
      @p = Post.find(params[:id])
    end
    @p.destroy
    respond_to do |format|
      format.html {redirect_to home_url, :notice => "Post destroyed!"}
      format.xml {head :ok}
    end
  end

end
