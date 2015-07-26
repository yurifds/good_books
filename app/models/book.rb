class Book < ActiveRecord::Base
  belongs_to :category
  has_many :ratings
  validates_presence_of :title, :author, :description
  has_attached_file :image_book, :styles => { :medium => "383x500>", :thumb => "143x202>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image_book, :content_type => /\Aimage\/.*\Z/
end
