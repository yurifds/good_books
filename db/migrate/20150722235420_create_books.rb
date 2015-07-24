class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :description
      t.string :price
      t.string :amazon_id
      t.integer :rating
      t.belongs_to :user, index: true, foreign_key: true, null: false
      t.belongs_to :category, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
