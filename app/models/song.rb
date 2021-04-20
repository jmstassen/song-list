class Song < ApplicationRecord
  has_many :lines
  has_many :song_selections
  has_many :setlists, through: :song_selections
  belongs_to :user
  
  accepts_nested_attributes_for :lines

  scope :alpha, -> { order(:title) }

end
