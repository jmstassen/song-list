class User < ApplicationRecord
  has_many :songs, dependent: :destroy
  has_many :setlist_permissions
  has_many :setlists, through: :setlist_permissions
  validates :username, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\Z/, message: "must contain only letters and/or numbers (and no spaces)" }
  validates :display_name, presence: true
  validates :email, presence: true, uniqueness: true

  has_secure_password
end
