class Director < ApplicationRecord
  has_many :movies
  belongs_to :movie_genre
end
