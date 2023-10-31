# db/seeds.rb

# Common password for all users
common_password = "password"

# Seed Users with the common password
10.times do
  User.create!(
    email: Faker::Internet.email,
    password: common_password,
    password_confirmation: common_password
  )
end

# Seed Instruments
10.times do
  Instrument.create!(
    price: Faker::Number.decimal(l_digits: 2),
    location: Faker::Address.city,
    user_id: User.pluck(:id).sample,
    category: Faker::Lorem.word,
    name: Faker::Lorem.word
  )
end

# Seed Bookings
10.times do
  Booking.create!(
    starting_date: Faker::Date.between(from: Date.today, to: 1.year.from_now),
    ending_date: Faker::Date.between(from: 1.day.from_now, to: 1.year.from_now),
    user_id: User.pluck(:id).sample,
    instrument_id: Instrument.pluck(:id).sample
  )
end

# Seed Reviews
10.times do
  Review.create!(
    comment: Faker::Lorem.sentence,
    rating: Faker::Number.between(from: 1, to: 5),
    instrument_id: Instrument.pluck(:id).sample
  )
end
