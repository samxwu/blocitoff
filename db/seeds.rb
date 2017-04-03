# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Create Users
10.times do User.create!(
    email: Faker::Internet.unique.email,
    password: 'password',
    password_confirmation: 'password',
    username: Faker::Name.unique.name,
    created_at: Faker::Time.between(DateTime.now - 3, DateTime.now),
    confirmed_at: Faker::Time.between(DateTime.now - 2, DateTime.now)
#    confirmed: true
    )
end

users = User.all

# Create Items

10.times do Item.create!(
    name: "Finish reading " + Faker::Book.title,
    user_id: [0,1,2,3,4,5,6,7,8,9,10].sample,
    created_at: Faker::Time.between(DateTime.now - 1, DateTime.now)
    )
end

items = Item.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"