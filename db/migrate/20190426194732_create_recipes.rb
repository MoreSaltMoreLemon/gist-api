class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :uuid, default: ''
      t.string :name, default: ''
      t.string :description, default: ''
      t.integer :user_id
      t.decimal :scale_factor, default: 0
      t.decimal :yield_in_grams, default: 0
      t.decimal :yield, default: 0
      t.integer :yield_unit_id, default: 1
      t.boolean :public, default: false

      t.timestamps
    end
  end
end
