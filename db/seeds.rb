# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

TagGossip.destroy_all
Like.destroy_all
SubComment.destroy_all
PrivateMessage.destroy_all
Tag.destroy_all
Comment.destroy_all
Gossip.destroy_all
User.destroy_all
City.destroy_all

10.times do
  City.create!(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
end

10.times do
  User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.paragraph(15), email: Faker::Internet.email, age: rand(15..80), city_id: City.all.sample.id)
end

20.times do
  Gossip.create!(title: Faker::HarryPotter.location, content: Faker::Lorem.paragraph(50), user_id: User.all.sample.id)
end

20.times do
  Comment.create!(content: Faker::Lorem.sentence, user_id: User.all.sample.id, gossip_id: Gossip.all.sample.id)
end

20.times do
  Tag.create!(title: Faker::HarryPotter.quote)
end

10.times do
  PrivateMessage.create!(content: Faker::Lorem.sentence, sender_id: User.all.sample.id, recipient_id: User.all.sample.id)
end

20.times do
  SubComment.create!(content: Faker::Lorem.sentence, user_id: User.all.sample.id, comment_id: Comment.all.sample.id)
end

20.times do
  Like.create!(user_id: User.all.sample.id, gossip_id: Gossip.all.sample.id, comment_id: Comment.all.sample.id)
end

20.times do
  TagGossip.create!(tag_id: Tag.all.sample.id, gossip_id: Gossip.all.sample.id)
end
