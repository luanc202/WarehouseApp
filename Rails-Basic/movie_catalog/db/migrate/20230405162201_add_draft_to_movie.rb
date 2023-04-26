class AddDraftToMovie < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :draft, :boolean, default: false
  end
end
