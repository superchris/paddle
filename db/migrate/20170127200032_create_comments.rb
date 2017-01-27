class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :full_name
      t.string :phone_number
      t.string :email
      t.string :skill_level
      t.text :message

      t.integer :user_id
      t.integer :place_id
      t.timestamps
    end

    add_index :comments, [:user_id, :place_id]
    add_index :comments, :place_id
  end
end
