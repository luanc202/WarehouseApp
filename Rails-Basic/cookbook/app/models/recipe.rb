class Recipe < ApplicationRecord
  enum status: { draft: 0, published: 1 }
  
  belongs_to :recipe_type
end
