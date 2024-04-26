class Movie < ApplicationRecord
  belongs_to :movie_genre
  has_one_attached :cover
  enum status: {draft: 0, published: 1}
  enum movie_status: {soon: 0, released: 1}
end
