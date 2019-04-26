class CreateIngredientYieldInGramsByUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredient_yield_in_grams_by_units do |t|
      t.integer :ingredient_id
      t.decimal :yield_in_grams
      t.integer :unit_id

      t.timestamps
    end
  end
end
