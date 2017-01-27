class AlterCommentsChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :comments, :place_id, :lesson_id
  end
end
