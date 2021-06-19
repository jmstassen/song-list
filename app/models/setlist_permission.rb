class SetlistPermission < ApplicationRecord
  belongs_to :user
  belongs_to :setlist

  def user_email
    self.user.email
  end
end
