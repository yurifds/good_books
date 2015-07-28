class Comment < ActiveRecord::Base
  belongs_to :book
  belongs_to :user
  validates_presence_of :body
end
