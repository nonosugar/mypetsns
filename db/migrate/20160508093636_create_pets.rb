class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :age
      t.string :type
      t.string :image
      t.text :phrase
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
