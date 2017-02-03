# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'rest-client'

url = "http://gateway.marvel.com/v1/public/characters?limit=1000&ts=1&apikey=57ab1c6e32a95ae9ec6239f9315e6b2b&hash=47f3aabe752fc92ef4e519679cbabd95"

restData = RestClient.get(url)
marvel_json = JSON.parse(restData)

characters = marvel_json['data']['results']
characters.each do |character|
  hash = {
    name: character['name'],
    description: character['description'],
    thumbnail: "#{character['thumbnail']['path']}.#{character['thumbnail']['extension']}",
    comic_count: character['comics']['available']
  }
  Character.create(hash)
end

require 'pry'
binding.pry
