Setlist App

Setlist
  has_many :song_selections
  has_many :setlist_permissions
  has_many :songs, through: :song_selections
  has_many :users, through: :setlist_permissions
  date
  location
  name

Song_Selections
  belongs_to :song
  belongs_to :setlist
  song_order

Song
  has_many :lines
  has_many :song_selections
  has_many :user_notes
  has_many :setlists, through: :song_selections
  title
  songwriter
  tempo
  key
  note

Line
  belongs_to :song
  lyrics
  chords
  references :song
  line_order

User
  has_many :user_notes
  has_many :setlist_permissions
  has_many :setlists, through: :setlist_permissions
  has_many :songs, through: :setlists
  has_secure_password

Setlist_Permissions
  belongs_to :user
  belongs_to :setlist
  edit_permission (boolean)

User_Note
  belongs to :user
  belongs to :song
  content