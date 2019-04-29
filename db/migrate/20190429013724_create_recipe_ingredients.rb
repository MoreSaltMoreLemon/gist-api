class CreateRecipeIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_ingredients do |t|
      t.integer :recipe_id
      t.integer :ingredient_id
      t.decimal :quantity
      t.integer :unit_id
      t.string :instruction
      t.decimal :yield
      t.integer :yield_unit_id

      t.timestamps
    end
  end
end
