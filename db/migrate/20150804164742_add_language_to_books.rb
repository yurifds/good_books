class AddLanguageToBooks < ActiveRecord::Migration
  def change
    add_column :books, :language, :string, null: false
  end
end
