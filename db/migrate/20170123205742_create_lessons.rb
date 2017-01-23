class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|

      t.string :name
      t.text :description
      t.string :date
      t.string :time
      t.string :location
      t.string :address


      t.timestamps
    end
  end
end
