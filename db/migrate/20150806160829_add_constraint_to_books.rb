class AddConstraintToBooks < ActiveRecord::Migration
  def change
    add_index :books, [:ISBN], name: "index_books_on_ISBN", unique: true
  end
end
