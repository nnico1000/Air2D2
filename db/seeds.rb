# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

Rent.destroy_all
Droid.destroy_all
User.destroy_all

PICTURE_DROID = ["https://www.starwars-universe.com/images/encyclopedie/droides/vignettes_v6/2vr8_vignette.png", "https://www.starwars-universe.com/images/encyclopedie/droides/vignettes_v6/droide_arbitre_he2_vignette.png", "https://www.starwars-universe.com/images/encyclopedie/droides/vignettes_v6/droiderqvig.jpg",
"https://www.starwars-universe.com/images/encyclopedie/droides/vignettes_v6/droide_dx11_vignette.png", "https://www.starwars-universe.com/images/encyclopedie/droides/vignettes_v6/t0b4_vignette.png", "https://www.starwars-universe.com/images/encyclopedie/droides/vignettes_v6/bf4f_vignette.png",
 "https://www.starwars-universe.com/images/encyclopedie/droides/vignettes_v6/yg3_vignette.png",
"https://www.starwars-universe.com/images/encyclopedie/droides/vignettes_v6/triple0_vig.png", "https://www.starwars-universe.com/images/encyclopedie/droides/vignettes_v6/o-66_vig.png", "https://www.starwars-universe.com/images/encyclopedie/droides/vignettes_v6/c3po_vignette.jpg",
"https://www.starwars-universe.com/images/encyclopedie/droides/vignettes_v6/R3DO_avatar.png", "https://www.starwars-universe.com/images/encyclopedie/droides/vignettes_v6/zero_vignette.png",
"https://www.starwars-universe.com/images/encyclopedie/droides/vignettes_v6/z9v86_vignette.png", "https://www.starwars-universe.com/images/encyclopedie/droides/vignettes_v6/tyth_vignette.png", "https://www.starwars-universe.com/images/encyclopedie/droides/vignettes_v6/e10_vignette.jpg",
"https://i.pinimg.com/originals/fa/16/42/fa164207f82b769dec7719b3156355e3.jpg"]

PICTURE_USER = ["https://www.starwars-universe.com/images/encyclopedie/personnages/vignettes_v6/alecia_beck_vignette.jpg", "https://www.starwars-universe.com/images/encyclopedie/personnages/vignettes_v6/aleksin_vig.png", "https://www.starwars-universe.com/images/encyclopedie/personnages/vignettes_v6/Allia_avatar.png",
"https://www.starwars-universe.com/images/encyclopedie/personnages/vignettes_v6/althu_vignette.png", "https://www.starwars-universe.com/images/encyclopedie/personnages/vignettes_v6/alys_vignette.png", "https://www.starwars-universe.com/images/encyclopedie/personnages/vignettes_v6/Ansinvignette.png",
"https://www.starwars-universe.com/images/encyclopedie/personnages/vignettes_v6/Ansivvignette.png",
"https://www.starwars-universe.com/images/encyclopedie/personnages/vignettes_v6/arim_vignette.png", "https://www.starwars-universe.com/images/encyclopedie/personnages/vignettes_v6/aric_jorgan_vignette.png",
"https://www.starwars-universe.com/images/encyclopedie/personnages/vignettes_v6/thent_vignette.png",
"https://www.starwars-universe.com/images/encyclopedie/personnages/vignettes_v6/aza_gundo_vignette.png",
"https://www.starwars-universe.com/images/encyclopedie/personnages/vignettes_v6/abalen_vignette.png", "https://www.starwars-universe.com/images/encyclopedie/personnages/vignettes_v6/adison_vignette.png",
"https://www.starwars-universe.com/images/encyclopedie/personnages/vignettes_v6/azzim_anjiliac_v6.jpg", "https://www.starwars-universe.com/images/encyclopedie/personnages/vignettes_v6/abasi_vesco_vignette.png", "https://www.starwars-universe.com/images/encyclopedie/personnages/vignettes_v6/abbeth_vignette.png",
"https://www.starwars-universe.com/images/encyclopedie/personnages/vignettes_v6/achitan_vignette.png", "https://www.starwars-universe.com/images/encyclopedie/personnages/vignettes_v6/adame_vignette.jpg", "https://www.starwars-universe.com/images/encyclopedie/personnages/vignettes_v6/Alcida_vignette.png",
"https://www.starwars-universe.com/images/encyclopedie/personnages/vignettes_v6/alec_efran_vignette.png", "https://www.starwars-universe.com/images/encyclopedie/personnages/vignettes_v6/alis_saro_bakvalen_vignette.png", "https://www.starwars-universe.com/images/encyclopedie/personnages/vignettes_v6/alison_dawn_vignette.png",
"https://www.starwars-universe.com/images/encyclopedie/personnages/vignettes_v6/Allium_avatar.png"]
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

20.times do

  user = User.new(name: Faker::Name.unique.name, email: Faker::Internet.unique.email, password: ('a'..'z').to_a.sample(8).join, species: User::SPECIES.sample, planet: User::PLANET.sample, radio_frequency: rand(10000.0...100000.0))
  user_url = PICTURE_USER.sample
  file_user = open(user_url)
  user.photo.attach(io: file_user, filename: 'photo_user.png')
  user.save

  (1..5).to_a.sample.times do

    droid = Droid.new(name: Faker::Name.unique.first_name, category: Droid::CATEGORY.sample, builder: Droid::BUILDER.sample, age: (50..2000).to_a.sample, description: Faker::Lorem.paragraph(sentence_count: 3), price_per_year: (1000..10000).to_a.sample, era: Droid::ERA.sample)
    droid.user = user
    droid_url = (PICTURE_DROID.sample)
    file_droid = open(droid_url)
    droid.photo.attach(io: file_droid, filename: 'photo_droid.png')
    droid.save

  end

  user_two = User.new(name: Faker::Name.unique.name, email: Faker::Internet.unique.email, password: ('a'..'z').to_a.sample(8).join, species: User::SPECIES.sample, planet: User::PLANET.sample, radio_frequency: rand(10000.0...100000.0))
  user_two_url = PICTURE_USER.sample
  file_user_two = open(user_two_url)
  user_two.photo.attach(io: file_user_two, filename: 'photo_user_two.png')
  user_two.save

  (1..5).to_a.sample.times do

    droid_two = Droid.new(name: Faker::Name.unique.first_name, category: Droid::CATEGORY.sample, builder: Droid::BUILDER.sample, age: (50..2000).to_a.sample, description: Faker::Lorem.paragraph(sentence_count: 3), price_per_year: (1000..10000).to_a.sample, era: Droid::ERA.sample)
    droid_two.user = user_two
    droid_two_url = (PICTURE_DROID.sample)
    file_droid_two = open(droid_two_url)
    droid_two.photo.attach(io: file_droid_two, filename: 'photo_droid_two.png')
    droid_two.save

    start_year = rand(2000..2249)
    end_year = rand(2250..2490)
    rent = Rent.new(start_year: start_year, end_year: end_year)
    rent.user = user
    rent.droid = droid_two
    rent.save
  end

end

# PICTURE_USER.each do |picture|
#   user = User.new(name: Faker::Name.unique.name, email: Faker::Internet.unique.email, password: ('a'..'z').to_a.sample(8).join, species: User::SPECIES.sample, planet: User::PLANET.sample, radio_frequency: rand(10000.0...100000.0))
#   user_url = picture
#   puts picture
#   puts " --------------- "
#   file_user = open(user_url)
#   user.photo.attach(io: file_user, filename: 'photo_user.png')
#   user.save
# end












