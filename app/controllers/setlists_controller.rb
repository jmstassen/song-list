class SetlistsController < ApplicationController

  def new
    @songs = current_user.songs.all.alpha
    @setlist = Setlist.new
    n = 1
    10.times do
      @setlist.song_selections.build(:song_number => n)
      n += 1
    end
  end
      
  def create
    @setlist = Setlist.new(setlist_params)
    if @setlist.save
      SetlistPermission.create(:user_id => current_user.id, :setlist_id => @setlist.id, :permission => 0)
      redirect_to setlist_path(@setlist)
    else
      @songs = current_user.songs.all.alpha
      render :new
    end
  end

  def edit
    @setlist = Setlist.find(params[:id])
    if !can_current_user?(:edit, @setlist)
      redirect_to root_path
    else
      @songs = current_user.songs.all.alpha
      n = @setlist.song_selections.count + 1
      5.times do
        @setlist.song_selections.build(:song_number => n)
        n += 1
      end
    end
  end

  def update
    @setlist = Setlist.find(params[:id])
    @setlist.update(setlist_params)
    redirect_to setlist_path(@setlist)
  end

  def index
    if params[:user_id] && @user = User.find_by_id(params[:user_id])
      @setlists = current_user.setlists.all
    else
      @setlists = Setlist.all
    end
  end

  def show
    @setlist = Setlist.find_by_id(params[:id])
    if !can_current_user?(:view, @setlist)
      redirect_to root_path
    end
  end

  def destroy
    Setlist.find(params[:id]).destroy
    flash[:message] = "Setlist deleted."
    redirect_to user_path(current_user)
  end

  private

  def setlist_params
    params.require(:setlist).permit(
      :title, 
      :location, 
      :date, 
      song_selections_attributes: [
        :song_id, 
        :setlist_id, 
        :song_number,
        :id
      ]
    )
  end

end
