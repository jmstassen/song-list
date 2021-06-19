Setlist App

To Do
1. Implement setlist permissions
    Create new setlist permission (editable =< 100, viewable =< 1000 , destroyable =< 10)
    Delete setlist permission
    Check authoritzation in controllers
2. Slug username
    Slug display name into username from google oauth login
3. Edit User
    Delete User




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
  has_many :setlists, through: :song_selections
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



Basic User Stories

1. User (validates email, username (no spaces), display name, password)
    [X] create, 
    [ ] edit, 
    [X] index
2. Session 
    [X] create,
    [X] delete
3. Song (validates title)
    [X] create, 
    [X] view, 
    [ ] edit,
    [X] index
4. Setlist (validates title)
    [X] create, 
    [X] view (performance),
    [ ] edit,
    [X] index
5. User view ([X] User song index, [X] User setlist index)