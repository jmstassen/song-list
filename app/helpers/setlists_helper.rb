module SetlistsHelper


  def show_hide_edit(setlist)
    if can_current_user?(:edit, setlist)
      return ""
    else
      return "hide"
    end
  end

  def show_hide_delete(setlist)
    if can_current_user?(:destroy, setlist)
      return ""
    else
      return "-hide"
    end
  end
end
