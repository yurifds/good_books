class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :points, null: false
      t.text :comment, null: false
      t.belongs_to :user, index: true, foreign_key: true, null: false
      t.belongs_to :book, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
