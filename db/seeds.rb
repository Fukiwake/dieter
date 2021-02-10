# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


100.times do |n|
  name = Faker::Lorem.characters(number: 10)
  email = Faker::Internet.email
  User.create!(
  email: email,
  password: "testpass",
  name: name,
  sex: rand(1..2),
  birthyear: rand(1960..2015),
  birthdate: "01-23",
  height: rand(120..190),
  weight: rand(30..100),
  target_weight: rand(30..100),
  target_body_fat_percentage: rand(5..35),
  introduce: "よろしくおねがいします",
  profile_image_id: nil,
  diet_style1: rand(1..2),
  diet_style2: rand(1..2),
  diet_style3: rand(1..2),
  diet_style4: rand(1..2),
  confirmed_at: "2021-02-09 01:31:53"
  )
end

Diary.create!(
  title: "test",
  body: "test",
  weight: "80",
  body_fat_percentage: "25",
  post_date: "2021-01-23",
  image1_id: nil,
  image2_id: nil,
  image3_id: nil,
  user_id: 1
)

Diary.create!(
  title: "test2",
  body: "test2",
  weight: "60",
  body_fat_percentage: "30",
  post_date: "2021-01-23",
  image1_id: nil,
  image2_id: nil,
  image3_id: nil,
  user_id: 2
)