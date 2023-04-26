class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :release_year
      t.string :synopsis
      t.string :origin_country
      t.integer :length
      t.string :director
      t.string :genre

      t.timestamps
    end
  end
end
