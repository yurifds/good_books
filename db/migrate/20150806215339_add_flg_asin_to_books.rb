class AddFlgAsinToBooks < ActiveRecord::Migration
  def change
    add_column :books, :flgAsin, :boolean
  end
end
