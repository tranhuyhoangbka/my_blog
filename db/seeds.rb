# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#User.create username: "tranhuyhoang", email: "admin@myblog.com", password: "123456789",
            # password_confirmation: "123456789", photo: "wwwwwwwwwwwwww",
            # introduction: "wwwwwwwwwwwwwwwwwwwwwwwww wwwwwww wwwwwwwww wwwwwwwwww www"
# 10.times do |n|
#   User.create username: Faker::Name.name, email: "user#{n}@gmail.com", password: "123456789",
#             password_confirmation: "123456789", photo: "none",
#             introduction: "wwwwwwwwwwwwwwwwwwwwwwwww wwwwwww wwwwwwwww wwwwwwwwww www"
# end
# 20.times {Project.create(name: Faker::Company.name, description: Faker::Lorem.sentence)}
# 30.times do
#   Post.create!(title: Faker::Book.title, content: Faker::Lorem.paragraph)
# end

# arr = Post.limit(15).offset(10)
# Category.first.posts << arr

10.times do |n|
  birthday = rand(18.years..25.years).seconds.ago
  Student.create name: Faker::Name.name, birthday: birthday, age: (Time.now.year - birthday.year), address: Faker::Address.street_address, sex: %w[male female].sample, description: Faker::Lorem.sentence
end
