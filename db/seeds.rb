# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if User.count < 100 && (Rails.env == "test" or Rails.env == "development")
  1.upto(100) do |i|
    auth = Faker::Omniauth.facebook
    User.create(
      provider: auth[:provider],
      uid: auth[:uid],
      email: auth[:info][:email],
      image_url: auth[:info][:image],
      username: Faker::Name.first_name
    )
  end
  puts "Seeded with 100 Users"
else
  puts "Did not seed users b/c its more than 100 users and its in test or dev stage"
end