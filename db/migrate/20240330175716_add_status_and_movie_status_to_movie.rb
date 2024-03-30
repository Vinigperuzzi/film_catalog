class AddStatusAndMovieStatusToMovie < ActiveRecord::Migration[7.1]
  def change
    add_column :movies, :status, :integer, default: 0
    add_column :movies, :movie_status, :integer, default: 0
  end
end
