# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Rent.destroy_all
Droid.destroy_all
User.destroy_all

# hans = User.create!(name: "Hans", email: "hans@gmail.com", password: "123456")
# hans_2 = User.create!(name: "Hans2", email: "hans2@gmail.com", password: "123456")

# p 'users created'

# droid = Droid.create!(name: "droid", category: "combat", description: "great fighter", user: hans)
# droid2 = Droid.create!(name: "droid2", category: "médical", description: "great doctor", user: hans)
# droid3 = Droid.create!(name: "droid3", category: "combat", description: "great fighter", user: hans)
# droid4 = Droid.create!(name: "droid4", category: "médical", description: "great doctor", user: hans)

# p 'droid created'

# rent = Rent.create!(user: hans_2, droid: droid2)

# p 'rent created'

require 'faker'

puts "Creating 50 users, droids and rents"

50.times do
  user = User.new(name: Faker::Name.unique.name, email: Faker::Internet.unique.email, password: ('a'..'z').to_a.sample(8).join, species: User::SPECIES.sample, planet: User::PLANET.sample, radio_frequency: rand(10000.0...100000.0))
  user.save
  droid = Droid.new(name: Faker::Name.unique.first_name, category: Droid::CATEGORY.sample, builder: Droid::BUILDER.sample, age: (50..2000).to_a.sample, description: Faker::Lorem.paragraph(sentence_count: 3), price_per_year: (1000..10000).to_a.sample, era: Droid::ERA.sample)
  droid.user = user
  droid.save
  rent = Rent.new(start_year: rand(2000..2500), end_year: rand(2501..3000))
  rent.user = user
  rent.droid = droid
  rent.save
end

