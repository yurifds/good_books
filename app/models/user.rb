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
end
