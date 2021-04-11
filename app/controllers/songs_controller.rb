class SongsController < ApplicationController

  def new
    @song = Song.new
    @song.lines.build(line_order: 1)
    @song.lines.build(line_order: 2)
    @song.lines.build(line_order: 3)
    @song.lines.build(line_order: 4)
    @song.lines.build(line_order: 5)
    @song.lines.build(line_order: 6)
    @song.lines.build(line_order: 7)
    @song.lines.build(line_order: 8)
    @song.lines.build(line_order: 9)
    @song.lines.build(line_order: 10)
    @song.lines.build(line_order: 11)
  end
          
  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to song_path(@song)
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
      @songs = Song.all
    end
  end

  def show
    @song = Song.find_by_id(params[:id])
    redirect_to '/' if !@song
  end

  private
    
  def song_params
    params.require(:song).permit(
      :title,
      :songwriter,
      :tempo,
      :key,
      :note,
      :link,
      lines_attributes: [
        :lyrics,
        :chords,
        :line_order
      ]
    )
  end

end
