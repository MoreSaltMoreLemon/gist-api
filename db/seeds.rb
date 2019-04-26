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