ezra = User.create(
  username: 'ezra',
  password_digest: 'password',
  email: 'dummy@mail.com'
)

spiced_apple_butter = Recipe.create(
  name: 'spiced apple butter',
  user: ezra  
)

ing_apple_butter = Ingredient.create(name: "apple butter")
cayenne = Ingredient.create(name: "cayenne")
sumac = Ingredient.create(name: "sumac")
mace = Ingredient.create(name: "mace")
cinnamon = Ingredient.create(name: "cinnamon")

recipe_apple_butter = Recipe.create(user: ezra, name: 'apple butter', yield: 8000)

step_apple_butter = spiced_apple_butter.recipe_sub_recipes.build(sub_recipe: recipe_apple_butter).save

spiced_apple_butter.recipe_ingredients.build(
  quantity: 4, 
  ingredient: cayenne
).save
spiced_apple_butter.recipe_ingredients.build(
  quantity: 4, 
  ingredient: sumac
).save
spiced_apple_butter.recipe_ingredients.build(
  quantity: 4, 
  ingredient: mace
).save
spiced_apple_butter.recipe_ingredients.build(
  quantity: 8, 
  ingredient: cinnamon
).save


ing_apples = Ingredient.create(
  name: "apples"
)

ing_orange_peels = Ingredient.create(
  name: "orange zest"
)

step_ing_apples = recipe_apple_butter.recipe_ingredients.build(
  quantity: 20000,
  ingredient: ing_apples
)

step_ing_orange_zest = recipe_apple_butter.recipe_ingredients.build(
  quantity: 8,
  ingredient: ing_orange_peels
)