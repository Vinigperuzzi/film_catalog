class AddDirectorToMovie < ActiveRecord::Migration[7.1]
  def change
    add_reference :movies, :director, null: false, foreign_key: true, default: 0
  end
end
