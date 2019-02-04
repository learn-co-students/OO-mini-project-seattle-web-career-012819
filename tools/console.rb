require_relative '../config/environment.rb'

yong = User.new('Yong')
ezra = User.new('Ezra')

mac_and_cheese = Recipe.new('Mac and Cheese')
pho = Recipe.new('Pho')
noodles = Recipe.new('Noodles')
beef = Recipe.new('BEEF')


yong.add_recipe_card(noodles, 20190105, 5)
yong.add_recipe_card(pho, 20170613, 4)
yong.add_recipe_card(beef, 20180529, 3)
yong.add_recipe_card(mac_and_cheese, 20141212, 2)
ezra.add_recipe_card(pho, 20181225, 3)
ezra.add_recipe_card(mac_and_cheese, 20110101, 5)

noodles_ing = Ingredient.new('noodles')
stock = Ingredient.new('stock')
egg = Ingredient.new('egg')
shrimp = Ingredient.new('shrmip')
star_anise = Ingredient.new('star anise')
cheese = Ingredient.new('cheese')
steak = Ingredient.new('steak')
noodles_array = [noodles, stock, egg]
noodles.add_ingredients(noodles_array)


pho.add_ingredients([noodles, stock, star_anise, shrimp])
mac_and_cheese.add_ingredients([noodles, cheese])


beef.add_ingredients([steak])

yong.declare_allergen(egg)
ezra.declare_allergen(shrimp)
ezra.declare_allergen(egg)


binding.pry
