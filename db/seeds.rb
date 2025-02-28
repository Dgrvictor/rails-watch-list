# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'
puts "--------------------------------"
puts "Cleaning actualy database..."
Bookmark.destroy_all
Movie.destroy_all
List.destroy_all
puts "--------------------------------"
puts "Creating database..."
puts "--------------------------------"
puts "Creating movies..."
puts "--------------------------------"
10.times do
  movie = Movie.new(title: Faker::Movie.title, overview: Faker::Lorem.paragraph, poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: rand(0.0..10.0))
  movie.save
end
puts "Finished! Created #{Movie.count} movies."
puts "--------------------------------"

puts "Creating list..."
3.times do
  list = List.new(name: Faker::Artist.name)
  list.save
end
puts "Finished! Created #{List.count} lists."
puts "--------------------------------"

puts "Creating bookmarks..."
10.times do
  bookmark = Bookmark.new(comment: Faker::Lorem.paragraph, movie: Movie.all.sample, list: List.all.sample)
  bookmark.save
end
puts "Finished! Created #{Bookmark.count} bookmarks."
puts "--------------------------------"

puts "Your database is ready !"
puts "--------------------------------"
