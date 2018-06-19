class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :bookings
  has_many :lessons, through: :bookings
  has_many :user_languages
  has_many :languages, through: :user_languages
  has_many :user_interests
  has_many :interests, through: :user_interests
  has_many :messages
  has_many :subscriptions
  has_many :conversations, through: :messages

  validates :first_name, presence: true, on: :update
  validates :last_name, presence: true, on: :update
  validates :username, presence: true, on: :update
  validates :country, presence: true, on: :update

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
