class RemoveAmazonIdFromBooks < ActiveRecord::Migration
  def change
    remove_column :books, :amazon_id, :integer
  end
end
