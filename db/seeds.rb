User.create(
  username: 'ezra',
  password_digest: 'password',
  email: 'dummy@mail.com'
)

Recipe.create(
  name: 'blasted broccoli',
  user: User.all.first,
  scale_factor: 1,
  yield_in_grams: 2000,
  yield: 1,
  yield_unit_id: 1
)

Recipe.all.first.steps.build(
  sequence_order: 1,
  name: 'roast',
  yield_in_grams: 2000,
  yield: 1,
  yield_unit_id: 1,
  prep_time_minutes: 1,
  post_prep_time_minutes: 15
).save

Recipe.all.first.steps.first.step_ingredients.build(
  sequence_order: 1,
  ingredient_id: 1,
  quantity: 1,
  unit_id: 1,
  fixed: false
).save

Recipe.all.first.steps.first.step_ingredients.first.build_ingredient(
  name: 'broccoli'
)

