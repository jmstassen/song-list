class SongsController < ApplicationController

  def new
    @song = Song.new
  end
          
  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to songs_path
    else
      render :new
    end
  end
    
  def index
    if params[:setlist_id] && @setlist = Setlist.find_by_id(params[:setlist_id])
      @songs = @setlist.songs
    elsif params[:user_id] && @user = User.find_by_id(params[:user_id])
      @songs = @user.songs
    else
      @songs = current_user.songs
    end
  end

  private
    
  def song_params
    params.require(:song).permit(:title, :songwriter, :tempo, :key, :note, :link)
  end

end
