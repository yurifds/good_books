class User < ActiveRecord::Base
  validates_presence_of :name, :last_name
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :ratings

  def name_and_last_name
    "#{name} #{last_name}"
  end

  def rating_by_user(book)
    rating = ratings.where(user_id: id, book_id: book.id).first

    #if the user doesn't rating return 0 points
    if rating
      rating.points
    else
      0
    end
  end

end
