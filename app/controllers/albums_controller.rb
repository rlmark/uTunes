class AlbumsController < ApplicationController
  def new
    @current_album = Album.new
  end

  def create

    album = Album.find(params[:id])
    if album.update(params.require(:album).permit(:name, :artist, :description))
      redirect_to show_album_path(album.id)
    else
      album.destroy
      redirect_to new_album_path(album.id)
    end
  end

  def edit
    @current_album = Album.find(params[:id])


  end

  def update
    album = Album.find(params[:id])
    if album.update(params.require(:album).permit(:name, :artist, :description))
      redirect_to show_album_path(album.id)
    else
      redirect_to edit_album_path(album.id)
    end
  end

  def upcount
    album = Album.find(params[:id])
    album.update(upcount: album.upcount + 1)
    redirect_to show_album_path(album.id)
  end

  def delete
    Album.find(params[:id]).destroy
    redirect_to albums_path
  end

  def index
    @albums = Album.order('upcount DESC')
  end

  def show
    @album = Album.find(params[:id])
  end
end
