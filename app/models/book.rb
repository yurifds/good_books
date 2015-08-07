class Book < ActiveRecord::Base
  include ActiveModel::Validations

  acts_as_commentable
  belongs_to :category
  has_many :ratings
  validates_presence_of :title, :author, :description, :ISBN
  has_attached_file :image_book, :styles => { :medium => "280x395#", :thumb => "143x202#", :small => "52x72#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image_book, :content_type => /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, :attributes => :image_book, :less_than => 150.kilobytes
  validates_with AttachmentPresenceValidator, :attributes => :image_book

  validates :ISBN, :isbn_format => true, uniqueness: true, :unless => :flgAsin

  attr_accessor :captcha # virtual attribute, the honeypot
  validates :captcha, invisible_captcha: true



  LANGUAGES = ["Inglês", "Português"]

  def title_truncate
    title.truncate(25)
  end

  def book_url
    image_book.url(:small)
  end

  def average_rating
    ratings.average(:points).to_f
  end

  def amount_of_ratings
    "#{ratings.count} Avaliações"
  end

  class AsinValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      if value.present?
        response = HTTParty.get("http://www.amazon.com/dp/#{value}")
        if response.code != 200
          record.errors.add attribute, "/ASIN inválido!"
        end
      end
    end
  end

  validates :ISBN, asin: true

end
