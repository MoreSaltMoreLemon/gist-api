class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :color_id, default: 1
      t.integer :category_id

      t.timestamps
    end
  end
end
