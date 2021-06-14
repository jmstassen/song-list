class SongSelection < ApplicationRecord
  belongs_to :song
  belongs_to :setlist

  def song_title
    self.song.title
  end

end
