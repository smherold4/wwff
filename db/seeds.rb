# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


def users
  user1 = User.create!(
    first_name: 'Michael',
    last_name: 'Jordan',
    password: 'mmmmmm',
    password_confirmation: 'mmmmmm',
  )

  auth_key = UserAuthKey.create_for_user(user1)[0]
  puts "Auth Key for user1: #{auth_key}"
end

users