class CreateRecipeIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_ingredients do |t|
      t.integer :recipe_id
      t.integer :ingredient_id
      t.integer :sequence_order
      t.decimal :quantity
      t.integer :unit_id, default: 1
      t.string  :instruction
      t.integer :color_id, default: 1
      t.boolean :is_sub_recipe, default: false

      t.timestamps
    end
  end
end
