class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user, :upcoming_events, :recent_posts, :has_permission
  private
  
  def has_permission


    unless current_user
      redirect_to home_url, :notice => "Permission Denied"
      return false
    end
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def upcoming_events
    #default to 3 events within 30 days from now
    e = Event.where(:event_start => DateTime.now..DateTime.now+30.days).sort_by! {|event| event.event_start.to_i }[0,3]
  end
  
  def recent_posts
    p = Post.all[0,3]
  end
end
