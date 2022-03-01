# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
cool_cats_club = Club.create(name: 'Cool Cats', host_id: 1, book_id: 3)
cool_cats_club_2 = Club.create(name: 'Turing Nerds', host_id: 2, book_id: 6)
cool_cats_club_3 = Club.create(name: 'Sherlock Homies', host_id: 3, book_id: 7)

user_1 = User.create(username:'1', email: '1@mail.com')
user_2 = User.create(username:'2', email: '2@mail.com')
user_3 = User.create(username:'3', email: '3@mail.com')
user_4 = User.create(username:'4', email: '4@mail.com')

comment_1 = cool_cats_club.comments.create(title:'Hello', body: 'Blah', user_id: user_1.id)
comment_2 = cool_cats_club.comments.create(title:'Comments', body: 'Blah Blah', user_id: user_2.id)
comment_3 = cool_cats_club.comments.create(title:'Coolio', body: 'Blah Blah Blah', user_id: user_3.id)
comment_4 = cool_cats_club.comments.create(title:'Goodbye', body: 'Blah Blah Blah Blah', user_id: user_4.id)
comment_5 = cool_cats_club_2.comments.create(title:'Goodbye', body: 'Blah Blah Blah Blah', user_id: user_4.id)
comment_6 = cool_cats_club_3.comments.create(title:'Goodbye', body: 'Blah Blah Blah Blah', user_id: user_4.id)

cool_cats_club.users << user_1
cool_cats_club.users << user_2
cool_cats_club.users << user_3
cool_cats_club.users << user_4

cool_cats_club_2.users << user_4
cool_cats_club_3.users << user_4

cool_cats_club_2.users << user_3
cool_cats_club_3.users << user_3
