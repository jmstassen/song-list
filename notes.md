Setlist App

Setlist - created
  has_many :song_selections
  has_many :setlist_permissions
  has_many :songs, through: :song_selections
  has_many :users, through: :setlist_permissions
  date
  location
  title

Song_Selections - created
  belongs_to :song
  belongs_to :setlist
  song_order numeric (not integer)

Song - created
  has_many :lines
  has_many :song_selections
  has_many :user_notes
  has_many :setlists, through: :song_selections
  title
  songwriter
  tempo
  key
  note
  link

Line - created
  belongs_to :song
  lyrics
  chords
  references :song
  line_order

User - created
  has_many :user_notes
  has_many :setlist_permissions
  has_many :setlists, through: :setlist_permissions
  has_many :songs, through: :setlists
  has_secure_password
  display_name
  username
  email
  password_digest

Setlist_Permissions - created
  belongs_to :user
  belongs_to :setlist
  permission

User_Note - created
  belongs to :user
  belongs to :song
  content


Thinking through stories

User create
  Setlist create: My Songs
    SetlistPermission.create (permission: 11)

Setlist create
  SetlistPermission.create (permission: 0)

Song create
  SongSelection.create (setlist: My Songs, song_order: songs.count + 1)

Add song to setlist
  SongSelection.create (song_order: songs.count + 1)
  
