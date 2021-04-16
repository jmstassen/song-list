class User < ApplicationRecord
  has_many :songs
  has_many :setlist_permissions
  has_many :setlists, through: :setlist_permissions
  has_secure_password
end
