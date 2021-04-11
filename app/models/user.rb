class User < ApplicationRecord
  has_many :user_notes
  has_many :setlist_permissions
  has_many :setlists, through: :setlist_permissions
  has_many :songs, through: :setlists
  has_secure_password
  accepts_nested_attributes_for :setlists
end
