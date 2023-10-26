# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb
# Create Users
users = []
10.times do |i|
  users << User.create(email: "user#{i + 1}@example.com", password: 'password')
end
# Create Instruments with Category
categories = ['String', 'Wind', 'Percussion', 'Brass', 'Electronic']  # Add more categories as needed
instruments = []
users.each do |user|
  10.times do
    instruments << Instrument.create(
      price: rand(50..300),
      location: Faker::Address.city,
      category: categories.sample,
      user: user
    )
  end
end
# Create Reviews
instruments.each do |instrument|
  10.times do
    Review.create(
      comment: Faker::Lorem.sentence,
      rating: rand(1.0..5.0).round(1),
      instrument: instrument
    )
  end
end
# Create Bookings
users.each do |user|
  10.times do
    Booking.create(
      starting_date: Date.today + rand(1..30).days,
      ending_date: Date.today + rand(31..60).days,
      user: user
    )
  end
end
