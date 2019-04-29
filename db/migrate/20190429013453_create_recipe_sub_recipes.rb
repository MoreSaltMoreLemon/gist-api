class CreateRecipeSubRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_sub_recipes do |t|
      t.integer :recipe_id
      t.integer :sub_recipe_id

      t.timestamps
    end
  end
end
