class AddIsbnToBooks < ActiveRecord::Migration
  def change
    add_column :books, :ISBN, :string, null: false
  end
end
