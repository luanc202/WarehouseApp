class AddAttributesToBook < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :abstract, :string
    add_column :books, :genre, :string
  end
end
