class SetlistsController < ApplicationController

  def new
    @setlist = Setlist.new
  end
      
  def create
    @setlist = current_user.setlists.build(setlist_params)
    if @setlist.save
      redirect_to setlists_path
    else
      render :new
    end
  end

  private

  def setlist_params
    params.require(:setlist).permit(:title, :location, :date)
  end

end
