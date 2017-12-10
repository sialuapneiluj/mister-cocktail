require 'open-uri'
require 'json'


puts "seeding ingredients : call to the API"

	url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
	results = JSON.parse(open(url).read)["drinks"]
puts "#{results.count} ingredients will be added in the database"
	results.each do |result|
		ingredient = result["strIngredient1"]
		Ingredient.create(name: ingredient)
		puts "ingredient '#{ingredient}'' added to the database'"		
	end
puts "#{results.count} ingredients added in the database - END OF SEED"


	