class AddReleasedToMovie < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :released, :boolean, default: true
  end
end
