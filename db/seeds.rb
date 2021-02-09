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
  sex: "女", 
  birthdate: "2021-01-23", 
  height: 150, 
  target_weight: 50, 
  target_body_fat_percentage: nil, 
  introduce: "よろしくおねがいします", 
  profile_image_id: nil,
  diet_style1: nil,
  diet_style2: nil,
  diet_style3: "true",
  diet_style4: "true",
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