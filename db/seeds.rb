# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Country.create([
  { name: :Argentina, price: 0.45},
  { name: :Chile, price: 0.40},
  { name: :Brasil, price: 0.50},
])

City.create([
  { name: :Cordoba, price:  0.15},
  { name: :Morteros, price: 0.25 },
  { name: :Santiago, price: 0.18 },
  { name: :Buzios, price: 0.15 },
])

User.create([
  { email: "hugo@gmail.com", password: 123456789, country_id: 1, city_id: 1, subscription: 100 },
  { email: "fran@gmail.com", password: 123456789, country_id: 1, city_id: 1, subscription: 100 },
  { email: "emanuel@gmail.com", password: 123456789, country_id: 1, city_id: 2, subscription: 100 },
  { email: "jose@gmail.com", password: 123456789, country_id: 2, city_id: 2, subscription: 100 },
  { email: "mario@gmail.com", password: 123456789, country_id: 3, city_id: 3, subscription: 100 },
])


Call.create([
  { user_sender_id: 1, user_receiver_id: 2, start: DateTime.new(2021, 1, 4, 15, 10, 00), end:  DateTime.new(2021, 1, 4, 15, 25, 00) },
  { user_sender_id: 1, user_receiver_id: 2, start: DateTime.new(2021, 1, 10, 18, 00, 00), end:  DateTime.new(2021, 1, 10, 23, 30, 00) },

  { user_sender_id: 1, user_receiver_id: 2, start: DateTime.new(2021, 2, 20, 19, 30, 00), end:  DateTime.new(2021, 2, 21, 00, 30, 00) },
  { user_sender_id: 1, user_receiver_id: 4, start: DateTime.new(2021, 2, 25, 18, 00, 00), end:  DateTime.new(2021, 2, 25, 18, 15, 00) },

  { user_sender_id: 1, user_receiver_id: 3, start: DateTime.new(2021, 3, 3, 10, 00, 00), end:  DateTime.new(2021, 3, 3, 21, 10, 00) },
  { user_sender_id: 1, user_receiver_id: 5, start: DateTime.new(2021, 3, 5, 17, 10, 00), end:  DateTime.new(2021, 3, 5, 17, 10, 00) },

  { user_sender_id: 1, user_receiver_id: 3, start: DateTime.new(2021, 4, 10, 15, 00, 00), end:  DateTime.new(2021, 4, 10, 16, 10, 00) },
  { user_sender_id: 1, user_receiver_id: 2, start: DateTime.new(2021, 4, 20, 22, 10, 00), end:  DateTime.new(2021, 4, 22, 23, 10, 00) },

  { user_sender_id: 1, user_receiver_id: 3, start: DateTime.new(2021, 5, 5, 7, 00, 00), end:  DateTime.new(2021, 5, 5, 9, 00, 00) },
  { user_sender_id: 1, user_receiver_id: 2, start: DateTime.new(2021, 5, 25, 22, 10, 00), end:  DateTime.new(2021, 5, 25, 22, 30, 00) },

  { user_sender_id: 1, user_receiver_id: 2, start: DateTime.new(2021, 6, 4, 15, 10, 00), end:  DateTime.new(2021, 6, 4, 15, 17, 00) },
  { user_sender_id: 1, user_receiver_id: 2, start: DateTime.new(2021, 6, 5, 9, 00, 00), end:  DateTime.new(2021, 6, 5, 10, 30, 00) },
  { user_sender_id: 1, user_receiver_id: 2, start: DateTime.new(2021, 6, 4, 19, 30, 00), end:  DateTime.new(2021, 6, 4, 20, 15, 00) },
  { user_sender_id: 1, user_receiver_id: 2, start: DateTime.new(2021, 6, 4, 18, 00, 00), end:  DateTime.new(2021, 6, 5, 10, 00, 00) },
  { user_sender_id: 1, user_receiver_id: 3, start: DateTime.new(2021, 6, 3, 10, 00, 00), end:  DateTime.new(2021, 6, 3, 10, 25, 00) },
  { user_sender_id: 1, user_receiver_id: 5, start: DateTime.new(2021, 6, 5, 17, 10, 00), end:  DateTime.new(2021, 6, 5, 17, 55, 00) },
])






