class CreateDirectors < ActiveRecord::Migration[7.0]
  def change
    create_table :directors do |t|
      t.string :name
      t.string :nationality
      t.date :birthdate
      t.string :fav_genre

      t.timestamps
    end
  end
end
