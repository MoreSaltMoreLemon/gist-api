class CreateStepSubRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :step_sub_recipes do |t|
      t.integer :recipe_step_id
      t.integer :sub_recipe_id
      t.integer :sequence_order, default: 0
      t.decimal :quantity, default: 0
      t.integer :unit_id, default: 1
      t.string :instruction, default: ''
      t.string :color, default: '#a6cee3'
      t.boolean :is_sub_recipe, default: true

      t.timestamps
    end
  end
end
