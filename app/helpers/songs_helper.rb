module SongsHelper

  def tempo_and_key(song)
    if song.tempo == "" && song.key == ""
      return ""
    elsif song.tempo == ""
      return "Key: #{song.key}"
    elsif song.key == ""
      return "Tempo: #{song.tempo}"
    else
      return "Tempo: #{song.tempo} | Key: #{song.key}"
    end
  end

  def hide_song_edit(song)
    if song.user.id == current_user.id
      return ""
    else
      return "hide"
    end
  end
end