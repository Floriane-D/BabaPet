require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


15.times do
  user=User.new(
    email: Faker::Internet.email,
    password: "12345678",
    name: Faker::Name.name,
    description: ["My host can occupy all the spaces of my apartment, the sites made in a place with many trees and quiet that is in the street of the apartment, very close. They will have jokes to have fun and much attention and affection. I live alone and have to make all the weekend time available for my host.","My pet loves new friends! It's very playful! is a guaranteed treat for the hospet, which you can stroll through the entire stay! The area is very good for dogs, wide and flat sidewalks. From the side of the park, you have a ride for all hours. Always with the tutor-oriented frequency, and of course, never in the sun so as not to burn the paws."].sample,
    phone_number: "021 97474-7754",
    remote_avatar_url: "http://i.pravatar.cc/300", #"https://source.unsplash.com/300x300/?face",
    remote_location_url: ["http://kingdomlandscapes.com/images/uploads/gallery/20150205_113031.jpg", "https://www.rentfast.ca/rfc/listing_photos/6/7/4/9/1909476.v.6e924532cfc90b95d562551149f3ff28.jpg", "https://www.victorslandscaping.net/wp-content/uploads/2015/09/Clarendon4.jpeg", "https://ehq-production-canada.imgix.net/photos/images/bbba5d257514bc0fbe70accdebc9c5aa68933641/000/006/283/original/WP_20180704_15_24_43_Pro.jpg?auto=compress", "https://i.pinimg.com/originals/8e/e1/b7/8ee1b7f798db175af9ea1b8b9b156b77.jpg", "https://cache.legacy.net/usercontent/guestbook/photos/2017-05/2017-05-09/131838530.jpg", "https://storage.googleapis.com/idx-photos-gs.ihouseprd.com/CA-TULARE/130444/org/000.jpg", "https://1.bp.blogspot.com/-SUffhsmAmRI/V3RxYzn6BZI/AAAAAAAAC6Q/-4a9C1_1bOMf6Ow8uAV9q0VprR3ab79GQCLcB/s1600/20160424_145852.jpg"].sample,
    address: ["Rua Visconde de Pirajá, 550 - Ipanema - Rio de Janeiro - RJ, 22410-003",
      "Rua das Laranjeiras, 540 - Cosme Velho - Rio de Janeiro - RJ, 22241-090",
      "Avenida Nossa Sra. de Copacabana, 540 - Copacabana - Rio de Janeiro - RJ, 22050-002",
      "Avenida Vieira Souto, 460 - Ipanema - Rio de Janeiro - RJ, 22420-006",
      "Rua Rodolfo Dantas, 85 - Copacabana - Rio de Janeiro - RJ, 22020-040",
      "Rua Bom Pastor, 544 - Tijuca - Rio de Janeiro - RJ, 20521-060",
      "Rua Moura Brasil, 74 - Laranjeiras - Rio de Janeiro - RJ, 22231-200",
      "Ladeira da Glória, 26 - Glória - Rio de Janeiro - RJ, 22211-120",
      "Rua Voluntários da Pátria, 190 - Botafogo - Rio de Janeiro - RJ, 22270-010",
      "Rua São Clemente, 185 - Botafogo - Rio de Janeiro - RJ, 22250-040",
      "Rua Bambina, 54 - Botafogo - Rio de Janeiro - RJ, 22251-050",
      "Rua Mena Barreto, 161 - Botafogo - Rio de Janeiro - RJ, 22271-100"].sample
  )
  user.save!
end

100.times do
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
