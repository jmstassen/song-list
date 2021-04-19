class Setlist < ApplicationRecord
  has_many :song_selections
  has_many :setlist_permissions
  has_many :songs, through: :song_selections

  scope :today_or_future, lambda { where("date >= ?", Date.today) }   

end
