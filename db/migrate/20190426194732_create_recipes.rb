class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.decimal :scale_factor
      t.decimal :yield_in_grams
      t.decimal :yield
      t.integer :yield_unit_id
      t.boolean :public

      t.timestamps
    end
  end
end
