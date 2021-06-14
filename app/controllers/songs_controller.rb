class SongsController < ApplicationController

  def new
    if params[:setlist_id]
      @setlist = Setlist.find_by_id(params[:setlist_id])
    end
    @song = Song.new
    n = 1
    20.times do
      @song.lines.build(:line_number => n)
      n += 1
    end
  end
          
  def create
    @song = Song.new(song_params)
    @song.user_id = current_user.id
    if @song.save
      if params[:setlist_id] && @setlist = Setlist.find_by_id(params[:setlist_id])
        song_number = @setlist.songs.count + 1
        SongSelection.create(:song_id => @song.id, :setlist_id => @setlist.id, :song_number => song_number)
      end
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
    n = @song.lines.count + 1
    10.times do
      @song.lines.build(:line_number => n)
      n += 1
    end
    @lines = @song.lines
  end

  def update
    @song = Song.find(params[:id])
    @song.update(song_params)
    redirect_to song_path(@song)
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
        :id,
        :lyrics,
        :chords,
        :line_number
      ]
    )
  end

end
