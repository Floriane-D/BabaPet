require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


10.times do
  user=User.new(
    email: Faker::Internet.email,
    password: Faker::Internet.password(8),
    name: Faker::Name.name,
    description: ["
My host can occupy all the spaces of my apartment, the sites made in a place with many trees and quiet that is in the street of the apartment, very close. They will have jokes to have fun and much attention and affection. I live alone and have to make all the weekend time available for my host.","My pet loves new friends! It's very playful! is a guaranteed treat for the hospet, which you can stroll through the entire stay! The area is very good for dogs, wide and flat sidewalks. From the side of the park, you have a ride for all hours. Always with the tutor-oriented frequency, and of course, never in the sun so as not to burn the paws."].sample,
    phone_number: "021 97474-7754",
    remote_avatar_url: "https://source.unsplash.com/300x300/?face",
    remote_location_url: "https://source.unsplash.com/900x1700/?home,outdoor",
    address: Faker::Address.full_address
  )
  user.save!
end

20.times do
  availability = Availability.new(
    start_date:    Faker::Date.between(Date.today + 2.days, Date.today+5.days),
    end_date:  Faker::Date.between(Date.today + 5.days, Date.today+60.days),
    price: rand(30..200),
    user: User.all.sample
  )
  availability.save!
end


 # t.string "email"
 #    t.string "encrypted_password", default: "", null: false
 #    t.string "reset_password_token"
 #    t.datetime "reset_password_sent_at"
 #    t.datetime "remember_created_at"
 #    t.string "name"
 #    t.text "address"
 #    t.string "phone_number"
 #    t.datetime "created_at", null: false
 #    t.datetime "updated_at", null: false
 #    t.text "description"
 #    t.string "avatar"
 #    t.string "location"
 #    t.float "latitude"
 #    t.float "longitude"
