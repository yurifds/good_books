class Book < ActiveRecord::Base
  acts_as_commentable
  has_many :ratings, dependent: :destroy
  belongs_to :user
  validates_presence_of :title, :author, :description, :ISBN, :language
  has_attached_file :image_book, styles: { medium: '280x395#', thumb: '143x202#', small: '52x72#' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :image_book, content_type: /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, attributes: :image_book, less_than: 150.kilobytes
  validates_with AttachmentPresenceValidator, attributes: :image_book

  validates :ISBN, isbn_format: true, uniqueness: true, unless: :flgAsin
  # validate for Asin format
  validates :ISBN, asin: true, if: :flgAsin

  attr_accessor :captcha # virtual attribute, the honeypot
  validates :captcha, invisible_captcha: true

  LANGUAGES = %w(Inglês Português)

  def title_truncate
    title.truncate(25)
  end

  def book_url
    image_book.url(:small)
  end

  def average_rating
    ratings.average(:points).to_f
  end
end
