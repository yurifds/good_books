class RemoveCommentFromReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :comment, :string
  end
end
