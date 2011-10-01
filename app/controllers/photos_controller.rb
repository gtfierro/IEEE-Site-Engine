class PhotosController < ApplicationController

  def index
    @p = Picasa.albums
  end

  def show
    id = params[:id]
    if id
      @photos = Picasa.photos(:album_id => id)
      @album = Picasa.albums.select { |album| album[:id] == id }.first
    end
  end

end
