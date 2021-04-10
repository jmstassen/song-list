class SetlistsController < ApplicationController

  def new
    @setlist = Setlist.new
  end
      
  def create
    setlist = Setlist.new(setlist_params)
    if setlist.save
      SetlistPermission.create(:user_id => current_user.id, :setlist_id => setlist.id, :permission => 0)
      redirect_to setlists_path
    else
      render :new
    end
  end

  def index
    @setlists = current_user.setlists
  end

  private

  def setlist_params
    params.require(:setlist).permit(:title, :location, :date)
  end

end
