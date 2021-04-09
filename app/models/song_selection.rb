class SongSelection < ApplicationRecord
  belongs_to :song
  belongs_to :setlist
end
