class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :default_color
      t.integer :category_id

      t.timestamps
    end
  end
end
