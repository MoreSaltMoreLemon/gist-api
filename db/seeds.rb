Ingredient.destroy_all
StepIngredient.destroy_all
StepSubRecipe.destroy_all
RecipeStep.destroy_all
Recipe.destroy_all
Color.destroy_all
Unit.destroy_all
User.destroy_all


units = [
  {name: 'g', gram_conversion_factor: 1}, 
  {name: 'kg', gram_conversion_factor: 1000},
  {name: 'lb', gram_conversion_factor: 453.59},
  {name: 'oz', gram_conversion_factor: 28.35},
  {name: 'fl oz', gram_conversion_factor: 28.35},
  {name: 'each', gram_conversion_factor: nil},
  {name: 'bunch', gram_conversion_factor: nil},
  {name: 'pkg', gram_conversion_factor: nil},
  {name: 'can', gram_conversion_factor: nil},
  {name: 'container', gram_conversion_factor: nil}
]

units.map {|u| Unit.create(name: u[:name], gram_conversion_factor: u[:gram_conversion_factor])}

colors = [ '#a6cee3', '#1f78b4', '#b2df8a', '#33a02c', '#fb9a99', '#e3191b' ]

colors.map { |color| Color.create(hex: color) }

hold_all_orphans = User.create(
  uuid: '234aklj4dfad36-q346h',
  username: 'orphan',
  password_digest: 'password',
  email: 'dummy@mail.com'
)

ezra = User.create(
  uuid: '234klj436-q346h',
  username: 'ezra',
  password_digest: 'password',
  email: 'dummy@mail.com'
)


spiced_apple_butter = Recipe.create(uuid: '234kljsadfdas4fgf436-q346h', name: 'spiced apple butter', user: ezra, public: true, yield_unit_id: 1)

step1 = spiced_apple_butter.recipe_steps.build(uuid: '23346jtsrjd4klj436-q346h', sequence_order: 0, instruction: 'mix', name: 'mix', color: '#e3191b', yield: 2000)
step1.save
# ing_apple_butter = Ingredient.create(name: "apple butter", sequence_order: 0)
cayenne = Ingredient.create(uuid: '234klj438fitykjheg456-q346h', name: "cayenne")
sumac = Ingredient.create(uuid: '2sd4weh56sh3434klj436-q346h', name: "sumac")
mace = Ingredient.create(uuid: '2332ehg6djny4klj436-q346h', name: "mace")
cinnamon = Ingredient.create(uuid: '234klj43233dxfh-fg-4t6-q346h', name: "cinnamon")


recipe_apple_butter = Recipe.create(uuid: '2342klkj34lj436-q346h', user: ezra, name: 'apple butter', yield: 8000)

# byebug
step_apple_butter = step1.step_sub_recipes.build(uuid: '234kl22_kh35-fd-j436-q346h', sub_recipe: recipe_apple_butter, sequence_order: 0, quantity: 2000)
step_apple_butter.save
step1.step_ingredients.build(
  uuid: '234klj436hk43b3syesus-q346h',
  quantity: 4, 
  ingredient: cayenne,
  sequence_order: 1
).save

step1.step_ingredients.build(
  uuid: '23sd214klj436-q346h',
  quantity: 4, 
  ingredient: sumac,
  sequence_order: 2
).save
step1.step_ingredients.build(
  uuid: '234klj222436-q346h',
  quantity: 4, 
  ingredient: mace,
  sequence_order: 3
).save
step1.step_ingredients.build(
  uuid: '123234klj436-q346h',
  quantity: 8, 
  ingredient: cinnamon,
  sequence_order: 4
).save


ing_apples = Ingredient.create(uuid: '32234klj436-q346h', name: "apples")

ing_orange_peels = Ingredient.create(uuid: '234kaaabbfgflj436-q346h', name: "orange zest")

other_step = recipe_apple_butter.recipe_steps.build(uuid: 'asyt234klj436-q346h', sequence_order: 0, instruction: 'peel, then roast covered by foil', name: 'peel & roast', yield: 8000, yield_unit_id: 1)
other_step.save
step_ing_apples = other_step.step_ingredients.build(
  uuid: '234klj436-qag346h',
  quantity: 20000,
  ingredient: ing_apples,
  sequence_order: 0
).save
# byebug

step_ing_orange_zest = other_step.step_ingredients.build(
  uuid: '234kalj436-q3a346h',
  quantity: 8,
  ingredient: ing_orange_peels,
  sequence_order: 1
).save
