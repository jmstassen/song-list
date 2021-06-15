class User < ApplicationRecord
  has_many :songs, dependent: :destroy
  has_many :setlist_permissions, dependent: :destroy
  has_many :setlists, through: :setlist_permissions, dependent: :destroy
  validates :display_name, presence: true
  validates :email, presence: true

  has_secure_password
end
