# db/seeds.rb
User.destroy_all
Instrument.destroy_all
Review.destroy_all
Booking.destroy_all

# Instrument Categories and Names
instrument_categories = {
  'String Instruments' => ['Violin', 'Guitar', 'Electric Guitar', 'Bass Guitar', 'Harp'],
  'Wind Instruments' => ['Flute', 'Saxophone', 'Trumpet', 'Clarinet', 'Oboe'],
  'Percussion Instruments' => ['Drum Kit', 'Bongos', 'Xylophone', 'Djembe', 'Tambourine'],
  'Keyboard Instruments' => ['Piano', 'Organ', 'Synthesizer', 'Electric Keyboard', 'Accordion']
}

# Create Users
users = []
10.times do |i|
  users << User.create!(email: "user#{i + 1}@example.com", password: 'password')
end
p users
# Create Instruments with Category and Name
instruments = []
instrument_categories.each do |category, names|
  names.each do |name|
    instruments << Instrument.create(
        price: rand(30..99),
        location: Faker::Address.city,
        category: category,
        name: name,
        user: users.sample
      )
  end
end
puts "instrument create!!"
# Create Reviews
instruments.each do |instrument|
  10.times do
    Review.create(
      comment: Faker::Lorem.sentence,
      rating: rand(1.0..5.0).round(1),
      instrument: instrument,
      user: users.sample
    )
  end
end
puts "reviews!!"
# Create Bookings
users.each do |user|
  10.times do
    Booking.create(
      starting_date: Date.today + rand(1..30).days,
      ending_date: Date.today + rand(31..60).days,
      user: users.sample,
      instrument: instruments.sample
    )
  end
end
puts "booking create!!"
