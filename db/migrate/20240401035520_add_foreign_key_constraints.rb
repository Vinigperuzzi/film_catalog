class AddForeignKeyConstraints < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :movies, :directors, on_delete: :cascade
    add_foreign_key :movies, :movie_genres, on_delete: :cascade
  end
end
