class SongsController < ApplicationController

  def new
    @song = Song.new
  end
          
  def create
    @song = current_user.songs.build(song_params)
    if @song.save
      redirect_to songs_path
    else
      render :new
    end
  end
    
  private
    
  def song_params
    params.require(:song).permit(:title, :songwriter, :tempo, :key, :note, :link)
  end

end
