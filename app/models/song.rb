class Song < ApplicationRecord
  has_many :lines
  has_many :song_selections
  has_many :user_notes
  has_many :setlists, through: :song_selections
  accepts_nested_attributes_for :lines
end
