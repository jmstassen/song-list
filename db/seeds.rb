# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


users = User.create(
    [
        { email: 'andy@andy.com', display_name: 'Display Andy', password: 'password'},
        { email: 'bette@bette.com', display_name: 'Display Bette', password: 'password'},
        { email: 'charles@charles.com', display_name: 'Display Charles', password: 'password'},
        { email: 'don@don.com', display_name: 'Display Don', password: 'password'},
        { email: 'edward@edward.com', display_name: 'Display Edward', password: 'password'},
        { email: 'fred@fred.com', display_name: 'Display Fred', password: 'password'}
    ]
)

