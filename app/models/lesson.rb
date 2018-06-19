class Lesson < ApplicationRecord
  belongs_to :languages
  belongs_to :user

  validates :description, presence: true
  validates :price, presence: true
end
