class AddImageBookColummunsToBook < ActiveRecord::Migration
  def up
    add_attachment :books, :image_book
  end

  def down
    remove_attachment :books, :image_book
  end
end
