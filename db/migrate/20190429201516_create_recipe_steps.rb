class CreateRecipeSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_steps do |t|
      t.string :uuid, default: ''
      t.integer :recipe_id
      t.decimal :yield, default: 0
      t.decimal :yield_in_grams, default: 0
      t.integer :yield_unit_id, default: 1
      t.integer :sequence_order, default: 0
      t.string :color, default: '#a6cee3'
      t.string :name, default: ''
      t.string :instruction, default: ''

      t.timestamps
    end
  end
end
