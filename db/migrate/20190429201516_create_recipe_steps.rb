class CreateRecipeSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_steps do |t|
      t.integer :recipe_id
      t.decimal :yield
      t.decimal :yeild_in_grams
      t.integer :yield_unit_id, default: 1
      t.integer :sequence_order
      t.string :name
      t.string :instruction

      t.timestamps
    end
  end
end
