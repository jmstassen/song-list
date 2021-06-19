class Setlist < ApplicationRecord
  has_many :song_selections
  has_many :setlist_permissions, dependent: :destroy
  has_many :songs, through: :song_selections
  validates :title, presence: true

  accepts_nested_attributes_for :song_selections,
    reject_if: proc { |att| att['song_id'].blank? }

  scope :today_or_future, lambda { where("date >= ?", Date.today) }   

  def user_id
    sp = SetlistPermission.find(setlist_id = setlist.id, permission = 0)
    sp.user_id
  end

  def self.permissions_for(*args) 
    association = args[0]
    methods = args[1..-1]
    methods.each do |method_name|
      define_method "#{method_name}able_by?" do |user|
        assoc = self.send(association).find_by(:user_id => user.id)
        if !assoc
          return false
        else
          assoc.send("#{method_name}able?")
        end  
      end
    end
  end

  permissions_for :setlist_permissions, :edit, :view, :destroy
end
