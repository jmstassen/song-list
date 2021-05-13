Setlist App

Setlist
  has_many :song_selections
  has_many :setlist_permissions
  has_many :songs, through: :song_selections
  date
  location
  title

Song_Selections
  belongs_to :song
  belongs_to :setlist
  song_order numeric (not integer)

Song
  has_many :lines
  has_many :song_selections
  belongs_to :user
  title
  songwriter
  tempo
  key
  note
  link

Line
  belongs_to :song
  lyrics
  chords
  references :song
  line_order

User
  has_many :setlist_permissions
  has_many :setlists, through: :setlist_permissions
  has_many :songs
  has_secure_password
  display_name
  username
  email
  password_digest

Setlist_Permissions
  belongs_to :user
  belongs_to :setlist
  permission



Thinking through stories

User create, 

Setlist create

Song create, view, edit, index(my songs, all songs)

Add song to setlist
  SongSelection.create (song_order: songs.count + 1)
  SetlistPermission.create
  
View all of a user's songs
View all of a user's setlists
View a setlist
View a song