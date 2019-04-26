class CreateUserProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :bio
      t.datetime :birth_date

      t.timestamps
    end
  end
end
