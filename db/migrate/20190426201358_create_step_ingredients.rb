class CreateStepIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :step_ingredients do |t|
      t.integer :step_id
      t.integer :sequence_order
      t.integer :ingredient_id
      t.integer :recipe_id
      t.decimal :quantity
      t.integer :unit_id
      t.boolean :fixed

      t.timestamps
    end
  end
end
