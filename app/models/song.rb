class Song < ApplicationRecord
  has_many :lines
  has_many :song_selections
  belongs_to :user
  validates :title, presence: true
  
  accepts_nested_attributes_for :lines

  scope :alpha, -> { order(:title) }

end
