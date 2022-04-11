puts "Creating Networks..."
5.times do 
    Network.create(call_letters: Faker::Cannabis.cannabinoid_abbreviation, channel: Faker::Beer.brand)
end

puts "Creating Shows..."
10.times do
    Show.create(name: Faker::ProgrammingLanguage.name, day: "Wednesday", season: 1, genre: "Comedy", network_id: rand(1..5))
end

puts "Creating Actors..."
25.times do
    Actor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end

puts "Creating Characters..."
100.times do
    Character.create(name: Faker::FunnyName.name, catchphrase: Faker::TvShows::MichaelScott.quote, actor_id: rand(1..25), show_id: rand(1..10))
end