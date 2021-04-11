class SetlistPermissionsController < ApplicationController

  def index
    @setlist_permissions = SetlistPermission.all
  end

end
