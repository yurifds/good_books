class Book < ActiveRecord::Base
  belongs_to :category
  has_many :ratings
  has_many :comments
  validates_presence_of :title, :author, :description
  has_attached_file :image_book, :styles => { :medium => "280x395#", :thumb => "143x202#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image_book, :content_type => /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, :attributes => :image_book, :less_than => 150.kilobytes
  validates_with AttachmentPresenceValidator, :attributes => :image_book

  def average_rating
    ratings.average(:points).to_f
  end

end
