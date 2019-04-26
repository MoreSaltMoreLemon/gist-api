class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|
      t.integer :recipe_id
      t.integer :sequence_order
      t.string :name
      t.decimal :yield_in_grams
      t.decimal :yield
      t.integer :yield_unit_id
      t.integer :prep_time_minutes
      t.integer :post_prep_time_minutes

      t.timestamps
    end
  end
end
