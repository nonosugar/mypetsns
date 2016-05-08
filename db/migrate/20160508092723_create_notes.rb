class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.integer :user_id
      t.text :content
      t.string :image

      t.timestamps null: false
    end
  end
end
