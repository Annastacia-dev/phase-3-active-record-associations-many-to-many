puts "🌱 Seeding data..."

# run a loop 50 times
50.times do
  # create a game with random data
  game = Game.create(
    title: Faker::Game.title,
    genre: Faker::Game.genre,
    platform: Faker::Game.platform,
    price: rand(0..60) # random number between 0 and 60
  )

  # create between 1 and 5 reviews for each game
  rand(1..5).times do
    Review.create(
      score: rand(1..10),
      comment: Faker::Lorem.sentence,
      user_id: rand(1..50),
      game_id: game.id # use the ID (primary key) of the game as the foreign key
    )

    # create between 1 and 10 users for each review
    rand(1..10).times do
      User.create(
        name: Faker::Name.name,
      )
    end
  end
end

puts "🌱 Done seeding!"
