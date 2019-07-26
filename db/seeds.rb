# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require 'json'
# require 'open-uri'

Dose.delete_all if Rails.env.development?
Ingredient.delete_all if Rails.env.development?
Cocktail.delete_all if Rails.env.development?

# url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
# ingredientlist = open(url).read
# ingredients = JSON.parse(ingredientlist)


# # ingredients["drinks"].each do |ingre|
# #   i = Ingredient.create!(name: ingre["strIngredient1"])
# # end


# # puts "Created #{Ingredient.count} ingredients"

# url = 'https://raw.githubusercontent.com/maltyeva/iba-cocktails/master/recipes.json'
# cocklist = open(url).read
# cocktails = JSON.parse(cocklist)

# # cocktails.each do |ingre|
# #   Cocktail.create!(name: ingre["name"])
# # end



# ingredients["drinks"].each do |ingre|
#   Ingredient.create!(name: ingre["strIngredient1"])
# end

# cocktails.each do |ingre|
#   j = Cocktail.create(name: ingre["name"])

#   collection = %w(tea-spoon handful ggfu part)
#   d = Dose.create(ingredient: Ingredient.all.sample, cocktail: j, description: collection.sample)
#   # puts "Added #{d.description} of #{d.ingredient.name} to #{j.name}"
# end

# puts "Created #{Ingredient.count} ingredients"
# puts "Created #{Dose.count} doses"
# puts "Created #{Cocktail.count} cocktails"


require 'csv'

csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }


def read(filepath)
  CSV.new(open(filepath), :headers => :first_row).each do |row|
    # row = row.gsub!(/\A"|"\Z/, '')
    c =  Cocktail.find_or_create_by(name: row["name"])

    ingreArray = row["ingredients"].split(",")
    j = Ingredient.create(name: ingreArray.first)
    # p Ingredient.create!(name: row["name"])
    p Dose.create(description: row["toppings"], cocktail: c, ingredient: j )
  end
end

read('https://raw.githubusercontent.com/seatuna/bubble-tea-api/master/data/drinks.csv')

puts "Created #{Ingredient.count} ingredients"
puts "Created #{Dose.count} doses"
puts "Created #{Cocktail.count} cocktails"



# url = "https://source.unsplash.com/featured/?{boba}"
# cocktail = Cocktail.new(name: 'boba-random')
# cocktail.remote_photo_url = url
# cocktail.save

Cocktail.all.each do |cocktail|
  cocktail.remote_photo_url = "https://source.unsplash.com/featured/?{milk-tea}"
  cocktail.save
end

puts "created pictures!"
