Product.destroy_all
Client.destroy_all
User.destroy_all


puts "base vidée"

require 'faker'

user1 = User.create!(
    lastname: "Coco",
    firstname: "JOJO",
    password: "12345678",
    role: "Admin",
    tel: "06 25 56 56 56",
    email: "coco@gmail.com",
    comment: "Compte admin"
)

user2 = User.create!(
    lastname: Faker::Name.last_name,
    firstname: Faker::Name.first_name,
    password: "12345678",
    tel: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.email,
    comment: "Lorem"
)

client = Client.create!(
    username: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    phone: Faker::PhoneNumber.phone_number,
    mail: Faker::Internet.email,
    comment: "Lorem",
    actif: true,
    user_id: user1.id
)

puts "users créés"

10.times do |i|
    Product.create!(
        name: Faker::Book.title,
        number: Faker::Number.number(digits: 2),
        etat: "neuf",
        deliveryDate: Faker::Date.forward(days: 2),
        onSite: true,
        client_id: client.id
    )
end