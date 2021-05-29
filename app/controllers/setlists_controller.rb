class SetlistsController < ApplicationController

  def new
    @setlist = Setlist.new
  end
      
  def create
    if params[:user_id] && @user = User.find_by_id(params[:user_id])
    setlist = User.setlist.build(setlist_params)
      if setlist.save
        SetlistPermission.create(:user_id => current_user.id, :setlist_id => setlist.id, :permission => 0)
        redirect_to setlists_path
      else
        render :new
      end
    end
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
    params.require(:setlist).permit(:title, :location, :date)
  end

end
