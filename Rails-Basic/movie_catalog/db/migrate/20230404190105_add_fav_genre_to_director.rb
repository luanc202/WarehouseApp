class AddFavGenreToDirector < ActiveRecord::Migration[7.0]
  def change
    add_reference :directors, :movie_genre, null: false, foreign_key: true, default: 0
  end
end
