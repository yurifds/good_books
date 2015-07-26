class RenameReviewsToRatings < ActiveRecord::Migration
  def change
    rename_table :reviews, :ratings
  end
end
