class CreateUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :units do |t|
      t.string :name
      t.decimal :gram_conversion_factor

      t.timestamps
    end
  end
end
