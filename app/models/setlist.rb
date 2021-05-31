class Setlist < ApplicationRecord
  has_many :song_selections
  has_many :setlist_permissions
  has_many :songs, through: :song_selections
  
  scope :today_or_future, lambda { where("date >= ?", Date.today) }   

  def user_id
    sp = SetlistPermission.find(setlist_id = setlist.id, permission = 0)
    sp.user_id
  end

end
