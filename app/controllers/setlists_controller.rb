class SetlistsController < ApplicationController

  def new
    @setlist = Setlist.new
    n = 1
    10.times do
      @setlist.song_selections.build(:song_number => n)
      n += 1
    end
  end
      
  def create
    binding.pry
    @setlist = Setlist.new(setlist_params)
    if @setlist.save
      SetlistPermission.create(:user_id => current_user.id, :setlist_id => @setlist.id, :permission => 0)
      redirect_to setlist_path(@setlist)
    else
      render :new
    end
  end

  def edit
    @setlist = Setlist.find(params[:id])
  end

  def index
      @setlists = Setlist.all
  end

  def show
    @setlist = Setlist.find_by_id(params[:id])
    redirect_to '/' if !@setlist
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
        :song_number
      ]
    )
  end

end
