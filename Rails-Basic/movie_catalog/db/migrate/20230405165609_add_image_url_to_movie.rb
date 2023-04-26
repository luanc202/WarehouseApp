class AddImageUrlToMovie < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :image_url, :string, default: 'https://via.placeholder.com/300x450'
  end
end
