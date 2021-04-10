class SetlistsController < ApplicationController

  def new
    @setlist = Setlist.new
  end
      
  def create
    binding.pry
  end

  private

  def setlist_params
    params.require(:setlist).permit(:title, :location, :date)
  end

end
