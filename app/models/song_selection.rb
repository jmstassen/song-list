class SongSelection < ApplicationRecord
  belongs_to :song
  belongs_to :setlist

  def song_title=(title)
    self.song_title = Song.find_by(:id => self.song_id).title
  end

  def song_title
    self.song_title ? self.song.title : nil
  end

end
