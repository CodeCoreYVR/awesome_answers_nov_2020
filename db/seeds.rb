# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Answer.delete_all
Question.delete_all

200.times do
     created_at=Faker::Date.backward(days: 365*5)
    q=Question.create(
        title: Faker::Hacker.say_something_smart,
        body: Faker::ChuckNorris.fact,
        view_count: rand(100_000),
        created_at: created_at,
        updated_at: created_at
    )
# puts q.errors.full_messages
    if q.valid?
        q.answers = rand(0..15).times.map do 
            Answer.new(body: Faker::GreekPhilosophers.quote )
        end
    end
end

question=Question.all
answer=Answer.all

puts Cowsay.say("Generated #{question.count} questions.",:frogs)
puts Cowsay.say("Generated #{answer.count} answers.",:tux)


# Some terminal commands to delete create and run migration and seed files

# rails db:drop This will delete database from psql
# rails db:create This will recreate a database
# rails db:migrate To run all the migrations
# rails db:seed To tun the seed file
# rails db:reset To do all above in oneshot you can use this command