# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Comment.delete_all
Post.delete_all


NUM_POSTS = 200



NUM_POSTS.times do
  created_at = Faker::Date.backward(days: 365 * 2)
  p = Post.create(
    title: Faker::Marketing.buzzwords,
    body:  Faker::Lorem.paragraph_by_chars,
    created_at: created_at,
    updated_at: created_at
  )
  if p.valid?
  p.comments = rand(0..15).times.map do
     Comment.new(
     body:  Faker::Lorem.paragraph_by_chars
   )
   end
  end
end


post = Post.all
comment = Comment.all

puts Cowsay.say("Generated #{post.count} posts", :turtle)
puts Cowsay.say("Generated #{comment.count} comments", :sheep)
