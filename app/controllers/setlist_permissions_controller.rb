class SetlistPermissionsController < ApplicationController

  def index
    if params[:setlist_id] && @setlist = Setlist.find_by_id(params[:setlist_id])
      @setlist_permissions = @setlist.setlist_permissions
    elsif params[:user_id] && @user = User.find_by_id(params[:user_id])
      @setlist_permissions = @user.setlist_permissions
    else
      @setlist_permissions = SetlistPermissions.all
    end
  end

end
