class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :release_date
      t.string :sinopsis
      t.string :country
      t.integer :duration

      t.timestamps
    end
  end
end
