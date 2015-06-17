# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

20.times do

board = Board.create(topic: Faker::Lorem.word)


password = Faker::Internet.password
user = User.create(name: Faker::Internet.user_name,
                   password: password,
      password_confirmation: password,
                      email: Faker::Internet.safe_email)


link = Link.create(user_id: user.id, board_id: board.id,
                     title: Faker::Lorem.sentence(3),
                      info: Faker::Lorem.paragraph(2))

comment = Comment.create(user_id: user.id, link_id: link.id,
                            body: Faker::Lorem.paragraph(2))

end
