class CreateStepIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :step_ingredients do |t|
      t.integer :recipe_step_id
      t.integer :ingredient_id
      t.integer :sequence_order
      t.decimal :quantity
      t.integer :unit_id, default: 1
      t.string :instruction
      t.string :color
      t.boolean :is_sub_recipe, default: false

      t.timestamps
    end
  end
end
