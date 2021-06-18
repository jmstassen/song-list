class Song < ApplicationRecord
  has_many :lines, dependent: :destroy
  has_many :song_selections, dependent: :destroy
  has_many :setlists, through: :song_selections
  belongs_to :user
  validates :title, presence: true
  
  accepts_nested_attributes_for :lines,
    reject_if: proc { |att| att['lyrics'].blank? && att['chords'].blank? }

  scope :alpha, -> { order(:title) }

end
