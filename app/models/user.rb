class User < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :bookings
  has_many :lessons
  has_many :user_languages
  has_many :languages, through: :user_languages
  has_many :user_interests
  has_many :interests, through: :user_interests
  has_many :messages
  has_many :subscriptions
  has_many :conversations, through: :subscriptions

  validates :first_name, presence: true, on: :update
  validates :last_name, presence: true, on: :update
  validates :country, presence: true, on: :update

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



  def attending_lessons
    self.bookings.map {|booking| booking.lesson}.uniq!
  end
end
