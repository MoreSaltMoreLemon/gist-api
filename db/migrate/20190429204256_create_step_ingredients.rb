class CreateStepIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :step_ingredients do |t|
      t.string :uuid, default: ''
      t.integer :recipe_step_id
      t.integer :ingredient_id
      t.integer :sequence_order, default: 0
      t.decimal :quantity, default: 0
      t.integer :unit_id, default: 1
      t.string :instruction, default: ''
      t.string :color, default: '#a6cee3'
      t.boolean :is_sub_recipe, default: false

      t.timestamps
    end
  end
end
