module SetlistPermissionsHelper

  def show_hide_setlist_permission_edit(setlist_permission)
    if setlist_permission.user_id == Setlist.find_by_id(setlist_permission.setlist_id).user_id
      return "hide"
    else
      return ""
    end
  end

end
