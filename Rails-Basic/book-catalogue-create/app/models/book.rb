class Book < ApplicationRecord
  validates :title, :author, :publication_year, :abstract, :genre, presence: true
end
