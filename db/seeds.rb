units = [
  {name: 'g', gram_conversion_factor: 1}, 
  {name: 'kg', gram_conversion_factor: 1},
  {name: 'oz', gram_conversion_factor: 1},
  {name: 'fl oz', gram_conversion_factor: 1},
  {name: 'each', gram_conversion_factor: 1},
  {name: 'bunch', gram_conversion_factor: 1},
  {name: 'pkg', gram_conversion_factor: 1},
  {name: 'can', gram_conversion_factor: 1},
  {name: 'container', gram_conversion_factor: 1}
]

units.map {|u| Unit.create(name: u[:name], gram_conversion_factor: u[:gram_conversion_factor])}

colors = [ '#a6cee3', '#1f78b4', '#b2df8a', '#33a02c', '#fb9a99', '#e3191b' ]

colors.map { |color| Color.create(hex: color) }

ezra = User.create(
  username: 'ezra',
  password_digest: 'password',
  email: 'dummy@mail.com'
)

spiced_apple_butter = Recipe.create(name: 'spiced apple butter', user: ezra)

# ing_apple_butter = Ingredient.create(name: "apple butter", sequence_order: 0)
cayenne = Ingredient.create(name: "cayenne")
sumac = Ingredient.create(name: "sumac")
mace = Ingredient.create(name: "mace")
cinnamon = Ingredient.create(name: "cinnamon")

recipe_apple_butter = Recipe.create(user: ezra, name: 'apple butter', yield: 8000)

step_apple_butter = spiced_apple_butter.recipe_sub_recipes.build(sub_recipe: recipe_apple_butter, sequence_order: 0).save

spiced_apple_butter.recipe_ingredients.build(
  quantity: 4, 
  ingredient: cayenne,
  sequence_order: 1
).save
spiced_apple_butter.recipe_ingredients.build(
  quantity: 4, 
  ingredient: sumac,
  sequence_order: 2
).save
spiced_apple_butter.recipe_ingredients.build(
  quantity: 4, 
  ingredient: mace,
  sequence_order: 3
).save
spiced_apple_butter.recipe_ingredients.build(
  quantity: 8, 
  ingredient: cinnamon,
  sequence_order: 4
).save


ing_apples = Ingredient.create(name: "apples")

ing_orange_peels = Ingredient.create(name: "orange zest")

step_ing_apples = recipe_apple_butter.recipe_ingredients.build(
  quantity: 20000,
  ingredient: ing_apples,
  sequence_order: 0
)

step_ing_orange_zest = recipe_apple_butter.recipe_ingredients.build(
  quantity: 8,
  ingredient: ing_orange_peels,
  sequence_order: 1
)