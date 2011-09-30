class StaticsController < ApplicationController
  
  def about
  end

  def hope
  end

  def indrel
  end
  
  def photos
    @p = Picasa.albums
  end

end
