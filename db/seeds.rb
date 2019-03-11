require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


20.times do
  user=User.new(
    email: Faker::Internet.email,
    password: Faker::Internet.password(8),
    name: Faker::Name.name,
    description: ["hate pets","love tarantulas", "looking for a girlfriend to pet me"].sample,
    phone_number: "021 97474-7754",
    remote_avatar_url: Faker::Avatar.image,
    remote_location_url: "https://source.unsplash.com/900x1600/?house,grass",
    address: Faker::Address.full_address
  )
  user.save!
end

200.times do
  availability = Availability.new(
    start_date:    Faker::Date.between(Date.today + 2.days, Date.today+5.days),
    end_date:  Faker::Date.between(Date.today + 5.days, Date.today+60.days),
    price: Faker::Commerce.price,
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
