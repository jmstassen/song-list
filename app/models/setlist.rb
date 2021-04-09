class Setlist < ApplicationRecord
    has_many :song_selections
    has_many :setlist_permissions
    has_many :songs, through: :song_selections
    has_many :users, through: :setlist_permissions
end
