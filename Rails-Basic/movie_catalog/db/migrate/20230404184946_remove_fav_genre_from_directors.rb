class RemoveFavGenreFromDirectors < ActiveRecord::Migration[7.0]
  def change
    remove_column :directors, :fav_genre, :string
  end
end
