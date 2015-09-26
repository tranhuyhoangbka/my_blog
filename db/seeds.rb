# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# User.create username: "tranhuyhoang", email: "admin@myblog.com", password: "123456789",
#             password_confirmation: "123456789", photo: "wwwwwwwwwwwwww",
#             introduction: "wwwwwwwwwwwwwwwwwwwwwwwww wwwwwww wwwwwwwww wwwwwwwwww www"

30.times do
  Post.create!(title: Faker::Book.title, content: Faker::Lorem.paragraph)
end

arr = Post.limit(15).offset(10)
Category.first.posts << arr

